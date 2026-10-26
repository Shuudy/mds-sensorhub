import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/sensor.dart';
import '../repositories/sensor_repository.dart';
import 'async_state.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel({
    required this.repository,
    this.staleAfter = const Duration(seconds: 30),
    this.now = DateTime.now,
  });

  final SensorRepository repository;
  final Duration staleAfter;
  final DateTime Function() now;

  AsyncState<Sensor> _state = const Loading();
  bool _isRefreshing = false;
  DateTime? _lastSuccessAt;
  Timer? _staleTimer;

  AsyncState<Sensor> get state => _state;

  bool get isRefreshing => _isRefreshing;

  List<Sensor> get items => switch (_state) {
    Content(:final values) => List.unmodifiable(values),
    _ => const [],
  };

  int get sensorCount => items.length;
  int get onlineCount => items.where((sensor) => sensor.isOnline).length;
  bool get hasOfflineSensors => items.any((sensor) => !sensor.isOnline);

  bool get isStale =>
      _lastSuccessAt != null && now().difference(_lastSuccessAt!) >= staleAfter;

  String get lastRefreshLabel {
    final at = _lastSuccessAt;
    if (at == null) return 'Aucune actualisation réussie';
    String two(int n) => n.toString().padLeft(2, '0');
    return 'Dernière actualisation : ${two(at.hour)}:${two(at.minute)}:${two(at.second)}';
  }

  Future<void> load() async {
    if (_isRefreshing) return;
    _isRefreshing = true;
    _state = const Loading();
    notifyListeners();

    try {
      final sensors = await repository.fetchAll();
      _state = Content(sensors);
      _lastSuccessAt = now();
      _scheduleStaleNotification();
    } catch (error) {
      _state = Failure(error.toString());
    }

    _isRefreshing = false;
    notifyListeners();
  }

  void _scheduleStaleNotification() {
    _staleTimer?.cancel();
    _staleTimer = Timer(staleAfter, notifyListeners);
  }

  @override
  void dispose() {
    _staleTimer?.cancel();
    super.dispose();
  }
}
