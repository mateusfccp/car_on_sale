import 'dart:async';

import 'package:flutter/foundation.dart';

import 'result.dart';

/// A command action with no arguments that returns [T].
typedef CommandAction0<T> = Future<Result<T>> Function();

/// A command action that receives an [A] and returns [T].
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);

/// An adaptation of the Command pattern for Flutter.
///
/// It follows the idea proposed in Flutter's architecture case study.
///
/// This class encapsulates an action, exposes its running and error states, and
/// ensures that it can't be launched again until it finishes.
///
/// Consume the action result by listening to changes, then call [clearResult]
/// when the state is consumed.
sealed class Command<T> with ChangeNotifier {
  /// Whether the command is running.
  bool get running => _running;
  bool _running = false;

  Result<T>? _result;

  /// Whether the command resulted in an error.
  bool get error => _result is Error;

  /// Whether the command has been completed.
  bool get completed => _result is Ok;

  /// The last result of this command.
  ///
  /// If this command has never been executed or [clearResult] is called, `null`
  /// will be returned.
  Result<T>? get result => _result;

  /// Clear last action result.
  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    // Ensure the action can't launch multiple times.
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

/// [Command] without arguments.
final class Command0<T> extends Command<T> {
  /// Creates a command that runs the given [action].
  Command0(CommandAction0<T> action) : _action = action;

  final CommandAction0<T> _action;

  /// Executes the action.
  Future<void> call() => _execute(_action);
}
