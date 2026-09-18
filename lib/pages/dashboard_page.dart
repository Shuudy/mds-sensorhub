import 'package:flutter/material.dart';

import '../viewmodels/dashboard_viewmodel.dart';
import '../viewmodels/async_state.dart';
import '../widgets/failure_view.dart';
import '../widgets/sensor_list_view.dart';

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
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return switch (viewModel.state) {
            Loading() => const Center(child: CircularProgressIndicator()),
            Content(:final values) => SensorListView(sensors: values),
            Failure(:final message) => FailureView(
              message: message,
              onRetry: viewModel.load,
            ),
          };
        },
      ),
    );
  }
}
