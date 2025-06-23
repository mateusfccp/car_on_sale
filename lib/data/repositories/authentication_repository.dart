import 'package:cars_on_sale/core/result.dart';
import 'package:cars_on_sale/data/services/mock_jwt_service.dart';

/// A repository to deal with authentication.
abstract interface class AuthenticationRepository {
  /// Try to log in to the service with the given [user] and [password].
  Future<Result<String>> login({
    required String user,
    required String password,
  });
}

/// A mocked [AuthenticationRepository] that authenticates a fixed set of users.
final class MockAuthenticationRepository implements AuthenticationRepository {
  static const _users = {'user@domain.com': 'password'};

  @override
  Future<Result<String>> login({
    required String user,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    if (_users[user] == password) {
      final token = MockJWTService.createTokenForUser(user);
      return Result.ok(token);
    } else {
      return Result.error(AuthenticationFailedException(user: user));
    }
  }
}

/// An exception signaling that an authentication has failed.
final class AuthenticationFailedException implements Exception {
  /// Creates an [AuthenticationFailedException].
  const AuthenticationFailedException({required this.user});

  /// The user whose authentication failed.
  final String user;

  @override
  String toString() {
    return "Authentication failed. The user doesn't exist or the given "
        'password is incorrect.';
  }
}
