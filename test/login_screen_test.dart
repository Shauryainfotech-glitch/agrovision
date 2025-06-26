import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agrovision_mobile/domain/blocs/auth/auth_bloc.dart';
import 'package:agrovision_mobile/presentation/screens/auth/login_screen.dart';
import 'package:agrovision_mobile/core/theme/app_theme.dart';

void main() {
  group('LoginScreen', () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = AuthBloc();
    });

    tearDown(() {
      authBloc.close();
    });

    testWidgets('renders login form correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: BlocProvider.value(
            value: authBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      // Verify all UI elements are present
      expect(find.text('Welcome Back!'), findsOneWidget);
      expect(find.text('Sign in to continue to AgroVision'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Don\'t have an account?'), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('shows validation errors on empty form submission',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: BlocProvider.value(
            value: authBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      // Try to submit empty form
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify validation errors
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('shows validation error for invalid email',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: BlocProvider.value(
            value: authBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify validation error
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('shows validation error for short password',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: BlocProvider.value(
            value: authBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      // Enter short password
      await tester.enterText(find.byType(TextFormField).last, '12345');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify validation error
      expect(
          find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('submits form with valid data', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: BlocProvider.value(
            value: authBloc,
            child: const LoginScreen(),
          ),
        ),
      );

      // Enter valid credentials
      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');

      // Submit form
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify form submission (no validation errors)
      expect(find.text('Please enter your email'), findsNothing);
      expect(find.text('Please enter your password'), findsNothing);
      expect(find.text('Please enter a valid email'), findsNothing);
      expect(find.text('Password must be at least 6 characters'), findsNothing);
    });
  });
}
