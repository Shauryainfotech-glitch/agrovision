import 'package:flutter/material.dart';
import 'package:agrovision_mobile/presentation/screens/splash_screen.dart';
import 'package:agrovision_mobile/presentation/screens/auth/login_screen.dart';
import 'package:agrovision_mobile/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:agrovision_mobile/presentation/screens/auth/registration_screen.dart';

class AppRoutes {
  // Auth Routes
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Main App Routes
  static const String dashboard = '/dashboard';
  static const String fieldMonitoring = '/field-monitoring';
  static const String aiInsights = '/ai-insights';
  static const String sensorManagement = '/sensor-management';
  static const String taskManagement = '/task-management';
  static const String analytics = '/analytics';
  static const String expertConsultation = '/expert-consultation';
  static const String settings = '/settings';
  static const String notifications = '/notifications';

  // Feature-specific Routes
  static const String cropDetails = '/crop-details';
  static const String sensorDetails = '/sensor-details';
  static const String taskDetails = '/task-details';
  static const String weatherForecast = '/weather-forecast';
  static const String profile = '/profile';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _createRoute(const SplashScreen());
      case AppRoutes.login:
        return _createRoute(const LoginScreen());
      case AppRoutes.dashboard:
        return _createRoute(const DashboardScreen());
      case AppRoutes.register:
        return _createRoute(const RegistrationScreen());
      case AppRoutes.forgotPassword:
        return _createRoute(_buildComingSoonScreen('Forgot Password'));
      case AppRoutes.fieldMonitoring:
        return _createRoute(_buildComingSoonScreen('Field Monitoring'));
      case AppRoutes.aiInsights:
        return _createRoute(_buildComingSoonScreen('AI Insights'));
      case AppRoutes.sensorManagement:
        return _createRoute(_buildComingSoonScreen('Sensor Management'));
      case AppRoutes.taskManagement:
        return _createRoute(_buildComingSoonScreen('Task Management'));
      case AppRoutes.analytics:
        return _createRoute(_buildComingSoonScreen('Analytics'));
      case AppRoutes.expertConsultation:
        return _createRoute(_buildComingSoonScreen('Expert Consultation'));
      case AppRoutes.settings:
        return _createRoute(_buildComingSoonScreen('Settings'));
      case AppRoutes.notifications:
        return _createRoute(_buildComingSoonScreen('Notifications'));
      case AppRoutes.profile:
        return _createRoute(_buildComingSoonScreen('Profile'));
      default:
        return _createRoute(_buildNotFoundScreen());
    }
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static Widget _buildComingSoonScreen(String title) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.construction,
              size: 64,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => NavigationService.goBack(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildNotFoundScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              '404',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The page you are looking for does not exist.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => NavigationService.navigateToAndClearStack(
                AppRoutes.dashboard,
              ),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigateToAndReplace(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void navigateToAndClearStack(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static Future<dynamic> navigateToAndReplace(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static Future<dynamic> navigateToAndClearStack(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  static void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
