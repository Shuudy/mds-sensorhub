import 'package:flutter/material.dart';

import '../models/sensor.dart';
import '../widgets/sensor_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummySensors = [
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
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('SensorHub'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: dummySensors.length,
        itemBuilder: (context, index) {
          final sensor = dummySensors[index];
          return SensorCard(sensor: sensor);
        },
      ),
    );
  }
}
