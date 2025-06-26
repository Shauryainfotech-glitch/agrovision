import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:agrovision_mobile/data/models/sensor_data.dart';

// Events
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class DashboardLoadRequested extends DashboardEvent {}

class DashboardRefreshRequested extends DashboardEvent {}

class DashboardSensorDataUpdated extends DashboardEvent {
  final List<SensorData> sensorData;

  const DashboardSensorDataUpdated(this.sensorData);

  @override
  List<Object?> get props => [sensorData];
}

// States
abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final EnvironmentalMetrics environmentalMetrics;
  final List<SensorData> sensorData;
  final List<WeatherData> weatherForecast;
  final List<AlertData> alerts;
  final DateTime lastUpdated;

  const DashboardLoaded({
    required this.environmentalMetrics,
    required this.sensorData,
    required this.weatherForecast,
    required this.alerts,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        environmentalMetrics,
        sensorData,
        weatherForecast,
        alerts,
        lastUpdated,
      ];

  DashboardLoaded copyWith({
    EnvironmentalMetrics? environmentalMetrics,
    List<SensorData>? sensorData,
    List<WeatherData>? weatherForecast,
    List<AlertData>? alerts,
    DateTime? lastUpdated,
  }) {
    return DashboardLoaded(
      environmentalMetrics: environmentalMetrics ?? this.environmentalMetrics,
      sensorData: sensorData ?? this.sensorData,
      weatherForecast: weatherForecast ?? this.weatherForecast,
      alerts: alerts ?? this.alerts,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}

// Additional Data Models
class WeatherData {
  final String time;
  final String icon;
  final double temperature;
  final String description;
  final bool isNow;

  const WeatherData({
    required this.time,
    required this.icon,
    required this.temperature,
    required this.description,
    this.isNow = false,
  });

  static List<WeatherData> get sampleData => [
        const WeatherData(
          time: 'Now',
          icon: 'sunny',
          temperature: 24.0,
          description: 'Sunny',
          isNow: true,
        ),
        const WeatherData(
          time: '12 PM',
          icon: 'cloudy',
          temperature: 26.0,
          description: 'Cloudy',
        ),
        const WeatherData(
          time: '3 PM',
          icon: 'rain',
          temperature: 23.0,
          description: 'Rain',
        ),
        const WeatherData(
          time: '6 PM',
          icon: 'cloudy',
          temperature: 22.0,
          description: 'Cloudy',
        ),
        const WeatherData(
          time: '9 PM',
          icon: 'clear',
          temperature: 20.0,
          description: 'Clear',
        ),
      ];
}

class AlertData {
  final String id;
  final String title;
  final String description;
  final AlertSeverity severity;
  final DateTime timestamp;
  final String icon;

  const AlertData({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.timestamp,
    required this.icon,
  });

  static List<AlertData> get sampleData => [
        AlertData(
          id: '1',
          title: 'Low Soil Moisture',
          description: 'Field A requires immediate irrigation',
          severity: AlertSeverity.high,
          timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
          icon: 'water_drop',
        ),
        AlertData(
          id: '2',
          title: 'High Temperature',
          description: 'Temperature exceeds optimal range',
          severity: AlertSeverity.medium,
          timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
          icon: 'thermostat',
        ),
        AlertData(
          id: '3',
          title: 'Pest Detection',
          description: 'Unusual activity detected in Field B',
          severity: AlertSeverity.low,
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
          icon: 'bug_report',
        ),
      ];
}

enum AlertSeverity { high, medium, low }

// Bloc
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardLoadRequested>(_onDashboardLoadRequested);
    on<DashboardRefreshRequested>(_onDashboardRefreshRequested);
    on<DashboardSensorDataUpdated>(_onDashboardSensorDataUpdated);
  }

  Future<void> _onDashboardLoadRequested(
    DashboardLoadRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Load sample data
      final environmentalMetrics = EnvironmentalMetrics.sampleData;
      final sensorData = _generateSampleSensorData();
      final weatherForecast = WeatherData.sampleData;
      final alerts = AlertData.sampleData;

      emit(DashboardLoaded(
        environmentalMetrics: environmentalMetrics,
        sensorData: sensorData,
        weatherForecast: weatherForecast,
        alerts: alerts,
        lastUpdated: DateTime.now(),
      ));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  Future<void> _onDashboardRefreshRequested(
    DashboardRefreshRequested event,
    Emitter<DashboardState> emit,
  ) async {
    if (state is DashboardLoaded) {
      try {
        // Simulate API refresh
        await Future.delayed(const Duration(milliseconds: 500));

        final currentState = state as DashboardLoaded;
        final updatedMetrics = EnvironmentalMetrics.sampleData;
        final updatedSensorData = _generateSampleSensorData();

        emit(currentState.copyWith(
          environmentalMetrics: updatedMetrics,
          sensorData: updatedSensorData,
          lastUpdated: DateTime.now(),
        ));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    }
  }

  Future<void> _onDashboardSensorDataUpdated(
    DashboardSensorDataUpdated event,
    Emitter<DashboardState> emit,
  ) async {
    if (state is DashboardLoaded) {
      final currentState = state as DashboardLoaded;
      emit(currentState.copyWith(
        sensorData: event.sensorData,
        lastUpdated: DateTime.now(),
      ));
    }
  }

  List<SensorData> _generateSampleSensorData() {
    return [
      SensorData(
        id: '1',
        sensorType: 'Temperature',
        value: 24.5,
        unit: '°C',
        timestamp: DateTime.now(),
        location: 'Field A',
        status: SensorStatus.active,
      ),
      SensorData(
        id: '2',
        sensorType: 'Humidity',
        value: 65.0,
        unit: '%',
        timestamp: DateTime.now(),
        location: 'Field A',
        status: SensorStatus.active,
      ),
      SensorData(
        id: '3',
        sensorType: 'Soil Moisture',
        value: 78.0,
        unit: '%',
        timestamp: DateTime.now(),
        location: 'Field B',
        status: SensorStatus.active,
      ),
      SensorData(
        id: '4',
        sensorType: 'CO2',
        value: 420.0,
        unit: 'ppm',
        timestamp: DateTime.now(),
        location: 'Greenhouse',
        status: SensorStatus.active,
      ),
    ];
  }
}
