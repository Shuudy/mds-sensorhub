import 'package:flutter/material.dart';

import 'routes/app_router.dart';
import 'viewmodels/dashboard_viewmodel.dart';

void main() {
  final viewModel = DashboardViewModel();
  final router = createAppRouter(viewModel: viewModel);

  runApp(
    MaterialApp.router(
      title: 'SensorHub',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: router,
    ),
  );
}
