import 'package:flutter_test/flutter_test.dart';
import 'package:agrovision_mobile/domain/blocs/auth/auth_bloc.dart';

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = AuthBloc();
    });

    tearDown(() {
      authBloc.close();
    });

    test('initial state is AuthInitial', () {
      expect(authBloc.state, isA<AuthInitial>());
    });

    test('AuthLoginRequested event is properly created', () {
      final event = AuthLoginRequested(
        email: 'test@example.com',
        password: 'password123',
      );

      expect(event.email, 'test@example.com');
      expect(event.password, 'password123');
      expect(event.props, ['test@example.com', 'password123']);
    });

    test('AuthLogoutRequested event is properly created', () {
      final event = AuthLogoutRequested();
      expect(event.props, []);
    });

    test('AuthCheckRequested event is properly created', () {
      final event = AuthCheckRequested();
      expect(event.props, []);
    });

    test('AuthFailure state contains error message', () {
      final state = AuthFailure('Test error message');
      expect(state.message, 'Test error message');
      expect(state.props, ['Test error message']);
    });
  });
}
