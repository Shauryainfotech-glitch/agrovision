import 'package:flutter_test/flutter_test.dart';
import 'package:agrovision_mobile/domain/blocs/dashboard/dashboard_bloc.dart';
import 'package:agrovision_mobile/data/models/sensor_data.dart';

void main() {
  group('DashboardBloc', () {
    late DashboardBloc dashboardBloc;

    setUp(() {
      dashboardBloc = DashboardBloc();
    });

    tearDown(() {
      dashboardBloc.close();
    });

    test('initial state is DashboardInitial', () {
      expect(dashboardBloc.state, isA<DashboardInitial>());
    });

    test('DashboardLoadRequested event is properly created', () {
      final event = DashboardLoadRequested();
      expect(event.props, []);
    });

    test('DashboardRefreshRequested event is properly created', () {
      final event = DashboardRefreshRequested();
      expect(event.props, []);
    });

    test('DashboardSensorDataUpdated event is properly created', () {
      final sensorData = [
        SensorData(
          id: '1',
          sensorType: 'Temperature',
          value: 25.0,
          unit: '°C',
          timestamp: DateTime.now(),
          location: 'Field A',
          status: SensorStatus.active,
        ),
      ];

      final event = DashboardSensorDataUpdated(sensorData);
      expect(event.sensorData, sensorData);
      expect(event.props, [sensorData]);
    });

    test('DashboardError state contains error message', () {
      final state = DashboardError('Test error message');
      expect(state.message, 'Test error message');
      expect(state.props, ['Test error message']);
    });

    test('EnvironmentalMetrics sample data is valid', () {
      final metrics = EnvironmentalMetrics.sampleData;
      expect(metrics.temperature, 24.5);
      expect(metrics.humidity, 65.0);
      expect(metrics.soilMoisture, 78.0);
      expect(metrics.co2Level, 420.0);
      expect(metrics.timestamp, isA<DateTime>());
    });

    test('WeatherData sample data is valid', () {
      final weatherData = WeatherData.sampleData;
      expect(weatherData.length, 5);
      expect(weatherData.first.isNow, true);
      expect(weatherData.first.time, 'Now');
      expect(weatherData.first.temperature, 24.0);
    });

    test('AlertData sample data is valid', () {
      final alerts = AlertData.sampleData;
      expect(alerts.length, 3);
      expect(alerts.first.severity, AlertSeverity.high);
      expect(alerts.first.title, 'Low Soil Moisture');
    });
  });
}
