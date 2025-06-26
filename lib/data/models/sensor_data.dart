import 'package:equatable/equatable.dart';

class SensorData extends Equatable {
  final String id;
  final String sensorType;
  final double value;
  final String unit;
  final DateTime timestamp;
  final String location;
  final SensorStatus status;

  const SensorData({
    required this.id,
    required this.sensorType,
    required this.value,
    required this.unit,
    required this.timestamp,
    required this.location,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        sensorType,
        value,
        unit,
        timestamp,
        location,
        status,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sensorType': sensorType,
      'value': value,
      'unit': unit,
      'timestamp': timestamp.toIso8601String(),
      'location': location,
      'status': status.toString(),
    };
  }

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      id: json['id'] as String,
      sensorType: json['sensorType'] as String,
      value: json['value'] as double,
      unit: json['unit'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      location: json['location'] as String,
      status: SensorStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
      ),
    );
  }

  SensorData copyWith({
    String? id,
    String? sensorType,
    double? value,
    String? unit,
    DateTime? timestamp,
    String? location,
    SensorStatus? status,
  }) {
    return SensorData(
      id: id ?? this.id,
      sensorType: sensorType ?? this.sensorType,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      timestamp: timestamp ?? this.timestamp,
      location: location ?? this.location,
      status: status ?? this.status,
    );
  }
}

enum SensorStatus { active, inactive, error, maintenance }

class EnvironmentalMetrics extends Equatable {
  final double temperature;
  final double humidity;
  final double soilMoisture;
  final double co2Level;
  final DateTime timestamp;

  const EnvironmentalMetrics({
    required this.temperature,
    required this.humidity,
    required this.soilMoisture,
    required this.co2Level,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
        temperature,
        humidity,
        soilMoisture,
        co2Level,
        timestamp,
      ];

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'soilMoisture': soilMoisture,
      'co2Level': co2Level,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory EnvironmentalMetrics.fromJson(Map<String, dynamic> json) {
    return EnvironmentalMetrics(
      temperature: json['temperature'] as double,
      humidity: json['humidity'] as double,
      soilMoisture: json['soilMoisture'] as double,
      co2Level: json['co2Level'] as double,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  EnvironmentalMetrics copyWith({
    double? temperature,
    double? humidity,
    double? soilMoisture,
    double? co2Level,
    DateTime? timestamp,
  }) {
    return EnvironmentalMetrics(
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      soilMoisture: soilMoisture ?? this.soilMoisture,
      co2Level: co2Level ?? this.co2Level,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  static EnvironmentalMetrics get sampleData => EnvironmentalMetrics(
        temperature: 24.5,
        humidity: 65.0,
        soilMoisture: 78.0,
        co2Level: 420.0,
        timestamp: DateTime.now(),
      );
}
