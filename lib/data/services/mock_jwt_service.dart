import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

/// A service to simulate JWT operations that could be done in a backend.
///
/// This class is used to mock JWT functionality for authentication and
/// authrorization.
abstract final class MockJWTService {
  static final _secret = SecretKey('super hidden secret');

  /// Creates a JWT for the given [user].
  ///
  /// This token will have an expiration time of a week.
  static String createTokenForUser(String user) {
    // The token should last for 1 week
    final expireAt = DateTime.now().add(Duration(days: 7));
    final expirationSeconds = expireAt.millisecondsSinceEpoch ~/ 1000;
    final jwt = JWT({'sub': user, 'exp': expirationSeconds});

    return jwt.sign(_secret);
  }

  /// Verify the given [token] using the secret.
  static void verifyToken(String token) {
    JWT.verify(token, _secret);
  }
}
