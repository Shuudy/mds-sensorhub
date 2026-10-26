import 'package:flutter/material.dart';

import 'repositories/fake_sensor_repository.dart';
import 'routes/app_router.dart';
import 'viewmodels/dashboard_viewmodel.dart';

Future<void> main() async {
  final repository = FakeSensorRepository(
    latency: const Duration(seconds: 4),
    failingCalls: {1, 3},
  );
  final viewModel = DashboardViewModel(
    repository: repository,
    staleAfter: const Duration(seconds: 10),
  );
  final router = createAppRouter(viewModel: viewModel);

  viewModel.load();
  runApp(
    MaterialApp.router(
      title: 'SensorHub',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: router,
    ),
  );
}
