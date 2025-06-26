class AppConstants {
  // App Information
  static const String appName = 'AgroVision Mobile';
  static const String appVersion = '1.0.0';
  static const String companyName = 'Dawell Lifescience Private Limited';

  // API Configuration
  static const String baseUrl = 'https://api.agrovision.com';
  static const String apiVersion = 'v1';
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String settingsKey = 'app_settings';
  static const String languageKey = 'selected_language';

  // Database
  static const String databaseName = 'agrovision.db';
  static const int databaseVersion = 1;

  // Sensor Data Refresh Intervals
  static const Duration sensorDataRefreshInterval = Duration(seconds: 30);
  static const Duration weatherDataRefreshInterval = Duration(minutes: 15);
  static const Duration alertCheckInterval = Duration(minutes: 5);

  // Image Processing
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const double imageQuality = 0.8;

  // Map Configuration
  static const double defaultLatitude = 28.6139;
  static const double defaultLongitude = 77.2090;
  static const double defaultZoom = 10.0;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int maxUsernameLength = 30;

  // Supported Languages
  static const List<String> supportedLanguages = [
    'en', // English
    'hi', // Hindi
    'mr', // Marathi
    'gu', // Gujarati
    'ta', // Tamil
    'te', // Telugu
    'kn', // Kannada
    'bn', // Bengali
  ];

  // Feature Flags
  static const bool enableOfflineMode = true;
  static const bool enablePushNotifications = true;
  static const bool enableBiometricAuth = true;
  static const bool enableCrashReporting = true;
  static const bool enableAnalytics = true;
}
