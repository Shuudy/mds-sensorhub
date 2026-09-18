import 'package:flutter/foundation.dart';

import '../models/sensor.dart';
import '../repositories/sensor_repository.dart';
import 'async_state.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel({required this.repository});

  final SensorRepository repository;
  AsyncState<Sensor> _state = const Loading();

  AsyncState<Sensor> get state => _state;

  List<Sensor> get items => switch (_state) {
    Content(:final values) => List.unmodifiable(values),
    _ => const [],
  };

  int get sensorCount => items.length;
  int get onlineCount => items.where((sensor) => sensor.isOnline).length;
  bool get hasOfflineSensors => items.any((sensor) => !sensor.isOnline);

  Future<void> load() async {
    _state = const Loading();
    notifyListeners();

    try {
      final sensors = await repository.fetchAll();
      _state = Content(sensors);
    } catch (error) {
      _state = Failure(error.toString());
    }

    notifyListeners();
  }
}
