import 'autogram_service.dart' show IAutogramService;
import 'response_functions.dart' show unwrap;

/// An Exception throws from [IAutogramService] calls when calling
/// [unwrap].
class ServiceException implements Exception {
  /// The HTTP response status code.
  final int statusCode;

  /// Specific error code.
  final String? errorCode;

  /// Error message.
  final String message;

  /// Optional error details.
  final String? details;

  const ServiceException({
    required this.statusCode,
    this.errorCode,
    required this.message,
    this.details,
  });

  @override
  String toString() {
    if (errorCode != null) {
      return "$errorCode: $message";
    }

    return "HTTP $statusCode: $message";
  }
}
