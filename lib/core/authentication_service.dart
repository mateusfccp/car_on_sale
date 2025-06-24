import 'package:cars_on_sale/data/services/mock_jwt_service.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that handles the app authentication state.
///
/// It stores the authentication token returned from the login process so it can
/// be used to authorize requests.
///
/// The token is kept in a local storage so that the user doesn't have to
/// authenticate all the time. The class handles all the logic to invalid and
/// expired tokens.
final class AuthenticationService {
  /// Creates an [AuthenticationService].
  AuthenticationService({
    required SharedPreferencesAsync sharedPreferences,
    Logger? logger,
  }) : _logger = logger,
       _storage = sharedPreferences;

  final Logger? _logger;
  final SharedPreferencesAsync _storage;

  /// The authentication token, if the user is authenticated.
  String? get token => _token;
  String? _token;

  /// Whether the user is authenticated.
  bool get isAuthenticated => _token != null;

  static const _storageKey = 'token';

  /// Clears the token, effectively unauthenticating the user.
  ///
  /// The token is both cleared from the in-class state and removed from the
  /// local storage.
  Future<void> clearToken() async {
    _token = null;
    await _storage.remove(_storageKey);
    _logger?.info('Token cleared. The user is now unauthenticated.');
  }

  /// Loads the token stored in the secure storage.
  ///
  /// If the token is invalid or expired, deletes the token from the storage and
  /// clears the token of this class.
  ///
  /// This preferibly should only be called at the startup of the app.
  Future<void> restoreTokenFromStorage() async {
    _logger?.info('Trying to restore token from the local storage.');

    final token = await _storage.getString(_storageKey);

    if (token == null) {
      _logger?.info('No token found in the local storage.');
    } else {
      try {
        MockJWTService.verifyToken(token);
        _token = token;
        _logger?.info('Using token found in the local storage.');
      } on JWTException catch (error, stackTrace) {
        _logger?.warning(
          'The token in the storage is invalid. Clearing it.',
          error,
          stackTrace,
        );
        await clearToken();
      }
    }
  }

  /// Sets the token to the given value.
  ///
  /// After the token is set, it is also stored in a secure storage for future
  /// use.
  Future<void> setToken(String token) async {
    _logger?.info('Setting authentication token to $token.');
    _token = token;
    // notify listeners?
    _logger?.info('Storing token in local storage.');

    try {
      await _storage.setString(_storageKey, token);
    } on Exception catch (error, stackTrace) {
      _logger?.severe(
        "Couldn't store the token in the local storage.",
        error,
        stackTrace,
      );
    }
  }
}
