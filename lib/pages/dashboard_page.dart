import 'package:flutter/material.dart';

import '../viewmodels/dashboard_viewmodel.dart';
import '../viewmodels/async_state.dart';
import '../widgets/failure_view.dart';
import '../widgets/last_refresh_banner.dart';
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
        actions: [
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) => IconButton(
              tooltip: 'Actualiser',
              icon: const Icon(Icons.refresh),
              onPressed: viewModel.isRefreshing ? null : viewModel.load,
            ),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return Column(
            children: [
              LastRefreshBanner(
                label: viewModel.lastRefreshLabel,
                isStale: viewModel.isStale,
                isRefreshing: viewModel.isRefreshing,
              ),
              Expanded(
                child: switch (viewModel.state) {
                  Loading() => const Center(child: CircularProgressIndicator()),
                  Content(:final values) => SensorListView(sensors: values),
                  Failure(:final message) => FailureView(
                    message: message,
                    onRetry: viewModel.load,
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
