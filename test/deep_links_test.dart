import 'package:autogram_sign/src/deep_link_action.dart';
import 'package:test/test.dart';

/// Tests for the [parseDeepLinkAction] function.
void main() {
  const authority = "autogram.slovensko.digital";

  test('DeepLinkAction.parse throws ArgumentError for invalid URIs', () {
    expect(
      () => DeepLinkAction.parse(Uri.parse(""), authority: authority),
      throwsA(predicate((e) => e is ArgumentError && e.name == 'uri')),
    );

    expect(
      () => DeepLinkAction.parse(Uri.parse("foo://bar"), authority: authority),
      throwsA(predicate((e) => e is ArgumentError && e.name == 'uri')),
    );

    expect(
      () => DeepLinkAction.parse(
        Uri.parse("avm://autogram.slovensko.digital/test"),
        authority: authority,
      ),
      throwsA(predicate((e) => e is ArgumentError && e.name == 'uri')),
    );
  });

  test('DeepLinkAction.parse returns SignRemoteDocumentAction for proper URI',
      () {
    final uri = Uri.parse(
      "https://autogram.slovensko.digital/api/v1/qr-code?guid=e7e95411-66a1-d401-e063-0a64dbb6b796&key=EeESAfZQh9OTf5qZhHZtgaDJpYtxZD6TIOQJzRgRFgQ%3D&integration=eyJhbGciOiJFUzI1NiJ9.eyJzdWIiOiI3OGQ5MWRlNy0xY2MyLTQwZTQtOWE3MS0zODU4YjRmMDMxOWQiLCJleHAiOjE3MTI5MDk3MjAsImp0aSI6IjAwZTAxN2Y1LTI4MTAtNDkyNS04ODRlLWNiN2FhZDAzZDFhNiIsImF1ZCI6ImRldmljZSJ9.7Op6W2BvbX2_mgj9dkz1IiolEsQ1Z2a0AzpS5bj4pcG3CJ4Z8j9W3RQE95wrAj3t6nmd9JaGZSlCJNSV_myyLQ",
    );
    final value = DeepLinkAction.parse(uri, authority: authority);

    expect(value, const TypeMatcher<SignRemoteDocumentAction>());
    expect((value as SignRemoteDocumentAction), isNotNull);
    expect(value.guid, "e7e95411-66a1-d401-e063-0a64dbb6b796");
    expect((value).key, "EeESAfZQh9OTf5qZhHZtgaDJpYtxZD6TIOQJzRgRFgQ=");
    expect(
      (value).integration,
      "eyJhbGciOiJFUzI1NiJ9.eyJzdWIiOiI3OGQ5MWRlNy0xY2MyLTQwZTQtOWE3MS0zODU4YjRmMDMxOWQiLCJleHAiOjE3MTI5MDk3MjAsImp0aSI6IjAwZTAxN2Y1LTI4MTAtNDkyNS04ODRlLWNiN2FhZDAzZDFhNiIsImF1ZCI6ImRldmljZSJ9.7Op6W2BvbX2_mgj9dkz1IiolEsQ1Z2a0AzpS5bj4pcG3CJ4Z8j9W3RQE95wrAj3t6nmd9JaGZSlCJNSV_myyLQ",
    );
  });

  test('DeepLinkAction.parse returns RegisterIntegrationAction for proper URI',
      () {
    final uri = Uri.parse(
      "https://autogram.slovensko.digital/api/v1/qr-code-register?integration=eyJhbGciOiJFUzI1NiJ9.eyJqdGkiOiI3ZTBjMTBkNC1kY2FmLTRhNTYtYjA0YS1jMmIzNzc0ODM1YjciLCJzdWIiOiIxMTdhMGIwNC1mM2Q0LTQ5OWMtYTYxMy02YzY1MmU0ODZmMDEiLCJhdWQiOiJkZXZpY2UiLCJleHAiOjE3NzQ3MTg1Nzl9.tkc5qJwpEz2LPRnmhZVEPc_FM_iBRduinfIjUr8OzE1kgMJfuEZ8Kh4M2DGPXzSF-x5SgR5wXsXw_ZmW210zYA",
    );
    final value = DeepLinkAction.parse(uri, authority: authority);

    expect(value, const TypeMatcher<RegisterIntegrationAction>());
    expect((value as RegisterIntegrationAction), isNotNull);
    expect(value.integration,
        "eyJhbGciOiJFUzI1NiJ9.eyJqdGkiOiI3ZTBjMTBkNC1kY2FmLTRhNTYtYjA0YS1jMmIzNzc0ODM1YjciLCJzdWIiOiIxMTdhMGIwNC1mM2Q0LTQ5OWMtYTYxMy02YzY1MmU0ODZmMDEiLCJhdWQiOiJkZXZpY2UiLCJleHAiOjE3NzQ3MTg1Nzl9.tkc5qJwpEz2LPRnmhZVEPc_FM_iBRduinfIjUr8OzE1kgMJfuEZ8Kh4M2DGPXzSF-x5SgR5wXsXw_ZmW210zYA");
  });

  test('DeepLinkAction.parse returns also supports custom schemes', () {
    final uri = Uri.parse(
      "avm://autogram.slovensko.digital/api/v1/qr-code?guid=e7e95411-66a1-d401-e063-0a64dbb6b796&key=EeESAfZQh9OTf5qZhHZtgaDJpYtxZD6TIOQJzRgRFgQ%3D&integration=eyJhbGciOiJFUzI1NiJ9.eyJzdWIiOiI3OGQ5MWRlNy0xY2MyLTQwZTQtOWE3MS0zODU4YjRmMDMxOWQiLCJleHAiOjE3MTI5MDk3MjAsImp0aSI6IjAwZTAxN2Y1LTI4MTAtNDkyNS04ODRlLWNiN2FhZDAzZDFhNiIsImF1ZCI6ImRldmljZSJ9.7Op6W2BvbX2_mgj9dkz1IiolEsQ1Z2a0AzpS5bj4pcG3CJ4Z8j9W3RQE95wrAj3t6nmd9JaGZSlCJNSV_myyLQ",
    );
    final value = DeepLinkAction.parse(
      uri,
      customSchemes: {"avm"},
      authority: authority,
    );

    expect(value, const TypeMatcher<SignRemoteDocumentAction>());
  });
}
