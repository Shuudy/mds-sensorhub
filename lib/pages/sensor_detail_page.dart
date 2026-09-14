import 'package:flutter/material.dart';

import '../models/sensor.dart';

class SensorDetailPage extends StatelessWidget {
  final Sensor sensor;

  const SensorDetailPage({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capteur : ${sensor.room}'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('État : ${sensor.isOnline ? "En ligne" : "Hors ligne"}'),
            const SizedBox(height: 16),
            Text('Température : ${sensor.temperature}°C'),
            const SizedBox(height: 8),
            Text('Humidité : ${sensor.humidity}%'),
            const SizedBox(height: 8),
            const Text('Batterie : 82%'),
            const SizedBox(height: 8),
            const Text('Dernière mesure : Il y a 5 min'),
          ],
        ),
      ),
    );
  }
}
