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
          final guid = uri.requireParam("guid");
          final key = uri.requireParam("key");
          final integration = uri.queryParameters["integration"];

          return SignRemoteDocumentAction(
            guid: guid,
            key: key,
            integration: integration,
          );
        }(),
      "/api/v1/qr-code-register" => () {
          final integration = uri.requireParam("integration");

          return RegisterIntegrationAction(
            integration: integration,
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

extension on Uri {
  String requireParam(String key) {
    if (!queryParameters.containsKey(key)) {
      throw ArgumentError.value(
        toString(),
        "uri",
        '"$key" param is missing a value.',
      );
    }

    return queryParameters[key].toString();
  }
}
