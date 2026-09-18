import 'package:flutter/material.dart';

import 'repositories/fake_sensor_repository.dart';
import 'routes/app_router.dart';
import 'viewmodels/dashboard_viewmodel.dart';

Future<void> main() async {
  final repository = FakeSensorRepository(
    latency: const Duration(seconds: 2),
    shouldFail: true,
  );
  final viewModel = DashboardViewModel(repository: repository);
  final router = createAppRouter(viewModel: viewModel);

  await viewModel.load();
  runApp(
    MaterialApp.router(
      title: 'SensorHub',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: router,
    ),
  );
}
