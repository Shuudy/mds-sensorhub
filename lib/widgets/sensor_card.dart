import 'package:flutter/material.dart';

import '../models/sensor.dart';
import '../screens/sensor_detail_screen.dart';

class SensorCard extends StatelessWidget {
  final Sensor sensor;

  const SensorCard({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SensorDetailScreen(sensor: sensor),
            ),
          );
        },
        title: Text('${sensor.room} : ${sensor.temperature}°C'),
        subtitle: Text(
          'Humidité : ${sensor.humidity}% — ${sensor.isOnline ? "En ligne" : "Alerte"}',
        ),
      ),
    );
  }
}
