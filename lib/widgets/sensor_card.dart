import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/sensor.dart';

class SensorCard extends StatelessWidget {
  final Sensor sensor;

  const SensorCard({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.push('/sensor/${sensor.id}');
        },
        title: Text('${sensor.room} : ${sensor.temperature}°C'),
        subtitle: Text(
          'Humidité : ${sensor.humidity}% - ${sensor.isOnline ? "En ligne" : "Alerte"}',
        ),
      ),
    );
  }
}
