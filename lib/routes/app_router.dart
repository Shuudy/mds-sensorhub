import 'package:go_router/go_router.dart';

import '../pages/dashboard_page.dart';
import '../pages/sensor_detail_page.dart';
import '../viewmodels/dashboard_viewmodel.dart';

GoRouter createAppRouter({required DashboardViewModel viewModel}) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => DashboardPage(viewModel: viewModel),
      ),
      GoRoute(
        path: '/sensor/:sensorId',
        builder: (context, state) {
          final sensorId = state.pathParameters['sensorId'];
          final sensor = viewModel.items.firstWhere(
            (sensor) => sensor.id == sensorId,
            orElse: () => throw StateError('Capteur introuvable'),
          );
          return SensorDetailPage(sensor: sensor);
        },
      ),
    ],
  );
}
