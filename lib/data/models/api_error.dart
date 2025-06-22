import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

/// Represents a generic API error response.
@freezed
sealed class ApiError with _$ApiError {
  const factory ApiError({
    /// A key identifying the type of error, e.g., "maintenance".
    // ignore: invalid_annotation_target
    @JsonKey(name: 'msgKey') required String messageKey,

    /// A map of parameters associated with the error.
    // ignore: invalid_annotation_target
    @JsonKey(name: 'params') required ErrorParameters parameters,

    /// A user-friendly error message.
    required String message,
  }) = _ApiError;

  /// Creates an [ApiError] from a JSON object.
  factory ApiError.fromJson(Map<String, Object?> json) =>
      _$ApiErrorFromJson(json);
}

/// Represents the nested parameters within an [ApiError].
@freezed
sealed class ErrorParameters with _$ErrorParameters {
  const factory ErrorParameters({
    /// The delay in seconds, provided as a string.
    required String delaySeconds,
  }) = _ErrorParameters;

  /// Creates an [ErrorParameters] from a JSON object.
  factory ErrorParameters.fromJson(Map<String, Object?> json) =>
      _$ErrorParametersFromJson(json);
}
