import '../models/sensor.dart';
import 'sensor_repository.dart';

class FakeSensorRepository implements SensorRepository {
  FakeSensorRepository({
    List<Sensor>? sensors,
    this.latency = Duration.zero,
    this.failingCalls = const {},
    this.failure,
  }) : _sensors = List.unmodifiable(sensors ?? _defaultSensors);

  static const List<Sensor> _defaultSensors = [
    Sensor(
      id: '1',
      name: 'Thermostat',
      room: 'Salon',
      temperature: 21.8,
      humidity: 45.0,
      isOnline: true,
    ),
    Sensor(
      id: '2',
      name: 'Capteur Garage',
      room: 'Garage',
      temperature: 29.6,
      humidity: 61.0,
      isOnline: false,
    ),
    Sensor(
      id: '3',
      name: 'Capteur Chambre',
      room: 'Chambre',
      temperature: 19.2,
      humidity: 50.0,
      isOnline: true,
    ),
    Sensor(
      id: '4',
      name: 'Capteur Cuisine',
      room: 'Cuisine',
      temperature: 23.5,
      humidity: 55.0,
      isOnline: true,
    ),
    Sensor(
      id: '5',
      name: 'Capteur Salle de Bain',
      room: 'Salle de Bain',
      temperature: 25.0,
      humidity: 70.0,
      isOnline: false,
    ),
    Sensor(
      id: '6',
      name: 'Capteur Bureau',
      room: 'Bureau',
      temperature: 22.0,
      humidity: 40.0,
      isOnline: true,
    ),
  ];

  final List<Sensor> _sensors;
  final Duration latency;
  final Set<int> failingCalls;
  final Object? failure;

  int fetchCount = 0;

  @override
  Future<List<Sensor>> fetchAll() async {
    final call = ++fetchCount;
    if (latency > Duration.zero) {
      await Future<void>.delayed(latency);
    }

    if (failingCalls.contains(call)) {
      throw failure ?? StateError('Impossible de charger les capteurs');
    }

    return List.unmodifiable(_sensors);
  }
}
