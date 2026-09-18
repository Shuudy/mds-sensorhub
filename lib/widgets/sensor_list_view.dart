import 'package:flutter/material.dart';

import '../models/sensor.dart';
import 'sensor_card.dart';

class SensorListView extends StatelessWidget {
  const SensorListView({super.key, required this.sensors});

  final List<Sensor> sensors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sensors.length,
      itemBuilder: (context, index) => SensorCard(sensor: sensors[index]),
    );
  }
}
