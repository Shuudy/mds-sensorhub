import 'package:go_router/go_router.dart';

import '../pages/dashboard_page.dart';
import '../pages/sensor_detail_page.dart';
import '../viewmodels/dashboard_viewmodel.dart';
import '../widgets/failure_view.dart';

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
          final matchingSensors = viewModel.items.where(
            (sensor) => sensor.id == sensorId,
          );
          final sensor = matchingSensors.isEmpty ? null : matchingSensors.first;
          if (sensor == null) {
            return FailureView(
              message: 'Capteur introuvable',
              onRetry: () => context.go('/'),
            );
          }
          return SensorDetailPage(sensor: sensor);
        },
      ),
    ],
  );
}
