class ServiceException implements Exception {
  /// The HTTP status code of the response.
  final int statusCode;

  /// Error message.
  final String message;

  const ServiceException(this.statusCode, this.message);

  @override
  String toString() => "HTTP $statusCode: $message}";
}
