import 'package:flutter/material.dart';

import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/sensor_card.dart';

class DashboardPage extends StatelessWidget {
  final DashboardViewModel viewModel;

  const DashboardPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SensorHub'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: viewModel.sensorCount,
        itemBuilder: (context, index) {
          final sensor = viewModel.sensors[index];
          return SensorCard(sensor: sensor);
        },
      ),
    );
  }
}
