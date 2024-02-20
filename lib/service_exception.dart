class ServiceException implements Exception {
  /// The HTTP status code of the response.
  final int statusCode;

  /// Error message.
  final String message;

  /// Optional [SerializableError] sent from the server.
  final dynamic detail;

  factory ServiceException.fromStatusCode(
    int statusCode, [
    dynamic detail,
  ]) {
    final message = detail?.message ?? "Got HTTP $statusCode.";

    return ServiceException(statusCode, message, detail: detail);
  }

  const ServiceException(
    this.statusCode,
    this.message, {
    this.detail,
  });

  @override
  String toString() => "HTTP $statusCode: ${detail?.message ?? message}";
}
