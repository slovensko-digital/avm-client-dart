/// Supported Deep Link action.
sealed class DeepLinkAction {
  /// Parser app Deep Link URIs.
  ///
  /// It has to conform:
  ///  - schema: "https" or one of the [customSchemes]
  ///  - authority: [authority]
  ///  - path: "/api/v1/"
  ///
  /// Throws [ArgumentError] in case of invalid or unknown schema, authority
  /// or structure.
  static DeepLinkAction parse(
    Uri uri, {
    required String authority,
    Set<String> customSchemes = const {},
  }) {
    // Validate schema
    if (!(uri.scheme == 'https' || customSchemes.contains(uri.scheme))) {
      throw ArgumentError.value(
        uri.toString(),
        "uri",
        "Invalid or unsupported scheme.",
      );
    }

    // Validate authority (domain)
    if (uri.authority != authority) {
      throw ArgumentError.value(
        uri.toString(),
        "uri",
        "Invalid or unsupported authority.",
      );
    }

    // Validate path
    if (!uri.path.startsWith("/api/v1/")) {
      throw ArgumentError.value(
        uri.toString(),
        "uri",
        "Invalid or unsupported path.",
      );
    }

    return switch (uri.path) {
      "/api/v1/qr-code" => () {
          if (!uri.queryParameters.containsKey("guid")) {
            throw ArgumentError.value(
              uri.toString(),
              "uri",
              '"guid" param is missing a value.',
            );
          }

          if (!uri.queryParameters.containsKey("key")) {
            throw ArgumentError.value(
              uri.toString(),
              "uri",
              '"key" param is missing a value.',
            );
          }

          return SignRemoteDocumentAction(
            guid: uri.queryParameters["guid"]!,
            key: uri.queryParameters["key"]!,
            integration: uri.queryParameters["integration"],
          );
        }(),
      "/api/v1/qr-code-register" => () {
          if (!uri.queryParameters.containsKey("integration")) {
            throw ArgumentError.value(
              uri.toString(),
              "uri",
              '"integration" param is missing a value.',
            );
          }

          return RegisterIntegrationAction(
            integration: uri.queryParameters["integration"]!,
          );
        }(),
      _ => throw ArgumentError.value(
          uri.toString(),
          "uri",
          "Invalid or unsupported URI.",
        ),
    };
  }
}

/// Action to sign remote document.
class SignRemoteDocumentAction extends DeepLinkAction {
  final String guid;
  final String key;
  final String? integration;

  SignRemoteDocumentAction({
    required this.guid,
    required this.key,
    required this.integration,
  });

  @override
  String toString() {
    return "$runtimeType(guid: $guid)";
  }
}

/// Action to register with integration.
class RegisterIntegrationAction extends DeepLinkAction {
  final String integration;

  RegisterIntegrationAction({
    required this.integration,
  });

  @override
  String toString() {
    return "$runtimeType(integration: $integration)";
  }
}
