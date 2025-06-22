import 'package:cars_on_sale/core/result.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

abstract interface class AuthenticationRepository {
  Future<Result<String?>> login({
    required String user,
    required String password,
  });
}

final class MockAuthenticationRepository implements AuthenticationRepository {
  static const _users = {'user@domain.com': 'password'};
  static final _secret = SecretKey('secret');

  @override
  Future<Result<String?>> login({
    required String user,
    required String password,
  }) async {
    if (_users[user] == password) {
      // The token should last for 1 week
      final expireAt = DateTime.now().add(Duration(days: 7));

      final jwt = JWT({
        'sub': user,
        'exp': expireAt.millisecondsSinceEpoch ~/ 1000,
      });

      final token = jwt.sign(_secret);
      return Result.ok(token);
    } else {
      return Result.ok(null);
    }
  }
}
