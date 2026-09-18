import '../models/sensor.dart';

class DashboardViewModel {
  final List<Sensor> _sensors = [
    const Sensor(
      id: '1',
      name: 'Thermostat',
      room: 'Salon',
      temperature: 21.8,
      humidity: 45.0,
      isOnline: true,
    ),
    const Sensor(
      id: '2',
      name: 'Capteur Garage',
      room: 'Garage',
      temperature: 29.6,
      humidity: 61.0,
      isOnline: false,
    ),
    const Sensor(
      id: '3',
      name: 'Capteur Chambre',
      room: 'Chambre',
      temperature: 19.2,
      humidity: 50.0,
      isOnline: true,
    ),
  ];

  List<Sensor> get sensors => _sensors;

  int get sensorCount => _sensors.length;
  int get onlineCount => _sensors.where((sensor) => sensor.isOnline).length;
  bool get hasOfflineSensors => _sensors.any((sensor) => !sensor.isOnline);
}
