# AgroVision Mobile

A comprehensive Flutter-based agricultural management mobile application developed for Dawell Lifescience Private Limited.

## Overview

AgroVision Mobile is a smart agricultural management platform that provides real-time monitoring, AI-powered insights, and field management capabilities for farmers, agricultural officers, and government departments.

## Features

### Core Modules
- **Dashboard**: Real-time environmental metrics and quick actions
- **Field Monitoring**: GPS-based field mapping and crop health assessment
- **AI Intelligence**: Smart agricultural insights and recommendations
- **Sensor Management**: IoT device integration and monitoring
- **Task Management**: Agricultural activity planning and tracking
- **Analytics & Reporting**: Data-driven decision making tools
- **Expert Consultation**: AI chatbot and expert advisory services

### Key Capabilities
- Real-time sensor data monitoring
- Weather integration and forecasts
- Crop health analysis with camera integration
- AI-powered recommendations
- Offline functionality
- Multi-language support
- Push notifications
- Biometric authentication

## Technical Stack

### Framework & Languages
- **Flutter**: Cross-platform mobile development
- **Dart**: Programming language
- **Material Design 3**: UI/UX framework

### State Management
- **flutter_bloc**: BLoC pattern for state management
- **equatable**: Value equality for Dart objects

### Networking & APIs
- **dio**: HTTP client for API communication
- **connectivity_plus**: Network connectivity monitoring

### Local Storage
- **sqflite**: SQLite database for offline storage
- **shared_preferences**: Key-value storage
- **path**: File system path manipulation

### Maps & Location
- **google_maps_flutter**: Google Maps integration
- **geolocator**: Location services

### Camera & Media
- **camera**: Camera functionality
- **image_picker**: Image selection from gallery/camera
- **cached_network_image**: Efficient image loading and caching

### Firebase Services
- **firebase_core**: Firebase SDK core
- **firebase_messaging**: Push notifications
- **firebase_analytics**: User analytics
- **firebase_crashlytics**: Crash reporting

### UI Components
- **flutter_svg**: SVG image support
- **shimmer**: Loading animations
- **intl**: Internationalization support

## Project Structure

```
lib/
├── core/                 # Core functionality
│   ├── config/          # App configuration
│   ├── constants/       # App constants
│   ├── theme/           # App theming
│   └── utils/           # Utility functions
├── data/                # Data layer
│   ├── models/          # Data models
│   ├── repositories/    # Data repositories
│   └── services/        # API services
├── domain/              # Business logic
│   ├── blocs/           # Bloc state management
│   └── entities/        # Business entities
├── presentation/        # UI layer
│   ├── screens/         # App screens
│   ├── widgets/         # Reusable widgets
│   └── routes/          # App routing
└── main.dart            # App entry point
```

## Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd agrovision-mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For Web (development)
   flutter run -d web
   ```

### Configuration

1. **Firebase Setup**
   - Create a Firebase project
   - Add Android/iOS apps to the project
   - Download and place configuration files:
     - `android/app/google-services.json` (Android)
     - `ios/Runner/GoogleService-Info.plist` (iOS)

2. **API Configuration**
   - Update API endpoints in `lib/core/constants/app_constants.dart`
   - Configure authentication tokens and keys

3. **Maps Integration**
   - Obtain Google Maps API key
   - Add to `android/app/src/main/AndroidManifest.xml` and `ios/Runner/Info.plist`

## Development

### Code Style
- Follow Dart/Flutter style guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Maintain consistent formatting

### State Management
The app uses the BLoC pattern for state management:
- **Bloc**: Business logic components
- **Events**: User actions and external events
- **States**: UI states and data representations

### Testing
```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget/

# Run integration tests
flutter test integration_test/
```

### Building for Release

#### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

## API Integration

The app integrates with the AgroVision backend APIs:

- **Authentication**: User login, registration, token management
- **Sensor Data**: Real-time environmental monitoring
- **Field Management**: Crop and field information
- **AI Services**: Recommendations and analysis
- **Weather**: Forecasts and alerts

## Offline Support

The app provides offline functionality through:
- Local SQLite database for data storage
- Automatic data synchronization when online
- Offline indicators and user feedback
- Conflict resolution for data updates

## Security

- JWT token-based authentication
- Biometric authentication support
- Encrypted local storage
- HTTPS API communication
- Certificate pinning for enhanced security

## Performance

- Optimized for low-end devices
- Efficient memory usage
- Battery optimization
- Fast app startup times
- Smooth animations and transitions

## Accessibility

- Screen reader support
- High contrast mode
- Large text support
- Voice navigation
- Keyboard navigation

## Internationalization

Supported languages:
- English (default)
- Hindi
- Marathi
- Gujarati
- Tamil
- Telugu
- Kannada
- Bengali

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## License

This project is proprietary software owned by Dawell Lifescience Private Limited.

## Support

For technical support and questions:
- Email: support@dawell.com
- Documentation: [Internal Wiki]
- Issue Tracker: [Internal System]

## Changelog

### Version 1.0.0 (Initial Release)
- Basic app structure and navigation
- Authentication system
- Dashboard with environmental metrics
- Weather integration
- Quick actions and alerts
- Responsive UI design

## Roadmap

### Phase 1 (Months 1-2)
- Complete authentication system
- Enhanced dashboard functionality
- Basic sensor data integration

### Phase 2 (Months 3-4)
- Field monitoring with GPS
- AI intelligence module
- Camera integration for crop analysis

### Phase 3 (Months 5-6)
- Advanced analytics and reporting
- Expert consultation features
- Offline functionality

### Phase 4 (Months 7-8)
- Performance optimization
- Testing and quality assurance
- App store deployment

## Team

**Development Team**
- Project Manager: [Name]
- Flutter Developers: [Names]
- UI/UX Designer: [Name]
- QA Engineers: [Names]
- DevOps Engineer: [Name]

**Client**
- Dawell Lifescience Private Limited
- Excellence and Wellness
- Innovation for Nation - Surveillance to Soil, AI to Aid

---

*This project represents a significant step towards modernizing agricultural practices through technology, supporting farmers and agricultural professionals with powerful, accessible mobile tools.*
