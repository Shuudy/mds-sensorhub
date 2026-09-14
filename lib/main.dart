import 'package:flutter/material.dart';

import 'pages/dashboard_page.dart';

import 'viewmodels/dashboard_viewmodel.dart';

void main() {
  final viewModel = DashboardViewModel();

  runApp(
    MaterialApp(
      title: 'SensorHub',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: DashboardPage(viewModel: viewModel),
    ),
  );
}
