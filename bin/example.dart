/// End-to-end example of the [IAutogramService] document signing flow.
///
/// Walks the whole happy path against a live AVM server: create a plain text
/// document, inspect it, sign it with a hardcoded "John Doe" test certificate,
/// validate the result and finally delete the document again.
///
/// ```shell
/// # Against the default (production) server:
/// fvm dart run bin/example.dart
///
/// # Against a locally running avm-server:
/// fvm dart run bin/example.dart --base-url=http://localhost:3000/api/v1
/// ```
///
/// The signing certificate below is self-signed, so the AVM service has no
/// trust anchor for it. Signing still succeeds for the `XAdES_BASELINE_B`
/// level, but step 7 will report the signature as untrusted - that is expected
/// and is part of what this example demonstrates.
///
/// Known server-side issue: as of 2026-09-01 the production server answers
/// `DELETE /documents/{guid}` with HTTP 500 for every document, signed or not
/// (reproducible with plain `curl` and with either authentication scheme, while
/// `GET` on the same GUID still returns 200). Step 8 therefore reports a failed
/// cleanup against production; the call itself is correct.
library;

import 'dart:convert' show base64;
import 'dart:io';

import 'package:autogram_sign/autogram_sign.dart';
import 'package:basic_utils/basic_utils.dart' show CryptoUtils;

/// Default AVM server, same as [AutogramService]'s own default.
const _defaultBaseUrl = 'https://autogram.slovensko.digital/api/v1';

/// Argument used to point the example at a different server.
const _baseUrlArgument = '--base-url=';

/// RSA-2048 private key of the "John Doe" test identity.
///
/// Generated with `CryptoUtils.generateRSAKeyPair()`; it signs nothing but this
/// example, so it is intentionally checked in.
const _privateKeyPem = '''
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC79/v896l7k+gc
YgfViKk18XeXeCCVnW5tXCjr8hdRCgKZbqqkQtOrMb02P6MAoAvfkomqRLDXmHyC
OFyaepMwJFASyd1T6Kxl37XqALe8UKiNJRCxkX4PEoC7KkrQxbOgU5zsii2WverM
tFhleaI8COAi/Kv/YjGkrfkghdW/1sv4ubVymXgC4A/ckqTjcKu3OZmn28qhsxmu
D8ZPpFKhyuzMGVTigByZNr4FwxkpbUmmbq5hwVhn7ZXfmQ3EXOD58QnSb/2Ct3oQ
QEyDO4PNLnCDKgYgPs2INXqjZpnNhT9bTugOkV0Uy+szJJHl6FGQyYZLlbCYCOw/
7YiYgIaTAgMBAAECggEAPoxWnecLzsN5CXjVgojnRbwEP7MJpL+ub1WriFgWyjC6
jLP2tJJIPT9f5x1l8F9RlCP/C1mwPw3O4MZAimcfc3Wh756ct79FHuFCd4ulmFR+
wfkDhRMVD47op197Zd1j2IX6Qfv5D6BC8btRbvL6uV96tim+Uk0ql9IMhHYEmsEc
ak+8F/UZMaIKsta4JPy9yCiAn3X62qKlcKYKMN0nBeJVpMWOeDgIJGPdjC2P1XR8
jF3hCPDc5wqVSZm0ly3ai4fuMMh6c7jaoIxAwQvwWEaOOVkudZgsWgdXlAqanMve
Ow5Hp4J05/+j1JxYnrw/UZ7uTumDHjuTLOZBb558AQKBgQD0KCuCmBNjkIlvmB3Q
2L2zb3Jcv0Puad/0bb00AaPFn/yWjNrYKboQi+MyJ0WKwkl6pvBhshMjyuEGihLH
2MJV8Lah25oZp9ExRKez6DAqDNGJnjiyLGDNwF3Aai2tbcyF312J+iHvfXRJSEd5
HlCCJz8fEOieHgyE5rdJrXL5oQKBgQDFFhgsAHMYr//lVAdjNjdZ48ijLXIsyTpC
IxNWHvXwtFBcjK7EHq8g8TM36aEZ6yCXlLBKWjMdOxtAxprEUD8961Xm1DK6xFJ9
FkSf9l05ZZB59ZJi/h6WMwuMEuGaNZLX1HKOeDzCLPt2GvGaDuhogurBmK69HWfS
HoBES8gbswKBgQDQ1Pb6OYcD9yGGgK6n7mq7akyABdxdtNMoZyCYtfpVU5UhVBLv
JymNc4j9Yde6apmcveMHPN/gEmxMQpbztnPqO/yKDqIM5ZwpLtbeK2/e1531vo4x
34FhGvNVW7v8BdkUfEuuc3LJPB3VfGwdrY8g896qfLTqYTtGBWyqKSAZYQKBgQCn
frSCSMuIUqNGsdgpb/0wjs6IJ2peN5IkfQzE50EbFRMq5IDuuikZ9QMTZKF+ln43
dK0yM2A3WnE55s/HQW/N3sA9kV+frJNyLUebLtRhoDhd/d8v9EnoWm9Y1v8WgKtQ
dAP7oqH4YCRBZnqn9D19/K0oZOs0W9ZNE5Ds+f6R0wKBgGD3vdR9hUWG1AsLanpB
eUbBieZQO1vjxD46aKA5w8rLWKCtI/ApqqxUJNSegGaBA15TWLQOVJWT/CuqUe2j
RLCeBOhTuWdFLKv5ab4hB5Kyp/tuKVZr/DLvl3Iebu/DGB7aE3IJjWeEEaoznKa0
y1BBzkFUfv+2BwJQB7NhJ8U9
-----END PRIVATE KEY-----
''';

/// Self-signed X.509 certificate matching [_privateKeyPem].
///
/// Subject `CN=John Doe, O=Autogram Example, L=Bratislava, C=SK`,
/// `sha256WithRSAEncryption`, valid until 2046.
const _certificatePem = '''
-----BEGIN CERTIFICATE-----
MIIDGTCCAgGgAwIBAgIBATANBgkqhkiG9w0BAQsFADBQMREwDwYDVQQDEwhKb2hu
IERvZTEZMBcGA1UEChMQQXV0b2dyYW0gRXhhbXBsZTETMBEGA1UEBxMKQnJhdGlz
bGF2YTELMAkGA1UEBhMCU0swHhcNMjYwOTAxMTA0MDA1WhcNNDYwODI3MTA0MDA1
WjBQMREwDwYDVQQDEwhKb2huIERvZTEZMBcGA1UEChMQQXV0b2dyYW0gRXhhbXBs
ZTETMBEGA1UEBxMKQnJhdGlzbGF2YTELMAkGA1UEBhMCU0swggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQC79/v896l7k+gcYgfViKk18XeXeCCVnW5tXCjr
8hdRCgKZbqqkQtOrMb02P6MAoAvfkomqRLDXmHyCOFyaepMwJFASyd1T6Kxl37Xq
ALe8UKiNJRCxkX4PEoC7KkrQxbOgU5zsii2WverMtFhleaI8COAi/Kv/YjGkrfkg
hdW/1sv4ubVymXgC4A/ckqTjcKu3OZmn28qhsxmuD8ZPpFKhyuzMGVTigByZNr4F
wxkpbUmmbq5hwVhn7ZXfmQ3EXOD58QnSb/2Ct3oQQEyDO4PNLnCDKgYgPs2INXqj
ZpnNhT9bTugOkV0Uy+szJJHl6FGQyYZLlbCYCOw/7YiYgIaTAgMBAAEwDQYJKoZI
hvcNAQELBQADggEBAAYPpfoFN9gcdohxmqZQS/+SbxUlQNY4uLj7WCBCBxkzan5E
dBG7GN3ZhPFIwT0qCAYCigb9o3obWyVTcATAANhz1To+00BxeIRxtGIvHgstnlU3
up29gnyyxTgML05ELsh73QYlYDYj5aukCNAj3Mz4A4C+cwnnHZ+h/Tzt2q3UdU01
PTykKCwUKayyNpJq8toi+DBSXfLfXOmtq5rA7Bxwx8DEw3ubpNeFE4/Ou5N1F+oe
0SmFXZaaa0bVTqIoEr5vTMAYED2yd73HIOPgPE+GlYy9vHTp5UiiPTtTbVho5HoS
H9pzLuYxYxGeEJdoKvsd7EEbVL9RfpF4rxxrt/0=
-----END CERTIFICATE-----
''';

Future<void> main(List<String> arguments) async {
  final baseUrl = Uri.parse(_parseBaseUrl(arguments));

  // The server encrypts the stored document with this key; the same key must be
  // sent with every subsequent request for the same document.
  final encryptionKey = generateEncryptionKey();

  final service = AutogramService(
    baseUrl: baseUrl,
    encryptionKeySource: () => encryptionKey,
  );

  _log('AVM server: $baseUrl');
  _log('Signing as: CN=John Doe (self-signed test certificate)');

  String? documentId;

  try {
    documentId = await _createDocument(service);
    await _getDocumentParameters(service, documentId);
    await _getDocumentVisualization(service, documentId);

    final dataToSignStructure = await _setDataToSign(service, documentId);
    final signedData = _signLocally(dataToSignStructure);

    await _signDocument(service, documentId, dataToSignStructure, signedData);
    await _getDocumentValidation(service, documentId);
  } on ServiceException catch (exception) {
    _logError(exception);
    exitCode = 1;
  } finally {
    if (documentId != null) {
      await _deleteDocument(service, documentId);
    }
  }
}

/// 1. Creates a plain text document to be signed.
///
/// Mirrors the "Plain TXT document" example from the AVM OpenAPI schema:
/// plain text content with a `text/plain` payload MIME type, wrapped into an
/// ASiC-E container with a baseline-B XAdES signature.
Future<String> _createDocument(IAutogramService service) async {
  _step(1, 'createDocument');

  final documentId = await service.createDocument(
    const DocumentPostRequestBody(
      document: Document(
        filename: 'HelloWorld.txt',
        content: 'Hello world',
      ),
      parameters: SigningParameters(
        level: SigningParametersLevel.xadesBaselineB,
        container: SigningParametersContainer.asicE,
      ),
      payloadMimeType: 'text/plain',
    ),
  );

  _log('GUID: $documentId');

  return documentId;
}

/// 2. Reads back the signing parameters the server stored for the document.
Future<void> _getDocumentParameters(
  IAutogramService service,
  String documentId,
) async {
  _step(2, 'getDocumentParameters');

  final parameters = await service.getDocumentParameters(documentId);

  _log('level: ${parameters.level?.value}');
  _log('container: ${parameters.container?.value}');
  _log('digestAlgorithm: ${parameters.digestAlgorithm?.value}');
}

/// 3. Requests the rendering used to show the document to the signer.
Future<void> _getDocumentVisualization(
  IAutogramService service,
  String documentId,
) async {
  _step(3, 'getDocumentVisualization');

  final visualization = await service.getDocumentVisualization(documentId);

  _log('filename: ${visualization.filename}');
  _log('mimeType: ${visualization.mimeType}');
  _log('content: ${visualization.content.length} chars');
}

/// 4. Sends the signing certificate and receives the structure to be signed.
///
/// This step is what makes [IAutogramService.signDocument] possible: the
/// returned [DataToSignStructure] has to be passed back unchanged so the server
/// can verify that what was signed is what it handed out.
Future<DataToSignStructure> _setDataToSign(
  IAutogramService service,
  String documentId,
) async {
  _step(4, 'setDataToSign');

  final dataToSignStructure = await service.setDataToSign(
    documentId,
    DataToSignRequestBody(
      signingCertificate: _base64Certificate,
      addTimestamp: false,
    ),
  );

  _log('dataToSign: ${dataToSignStructure.dataToSign.length} chars');
  _log(
    'signingTime: '
    '${DateTime.fromMillisecondsSinceEpoch(dataToSignStructure.signingTime)}',
  );

  return dataToSignStructure;
}

/// 5. Signs the received data locally with the "John Doe" private key.
///
/// This is the only step that does not touch the server, and in a real client
/// it is where the eID card (or another key store) would be used instead.
String _signLocally(DataToSignStructure dataToSignStructure) {
  _step(5, 'sign locally (SHA-256/RSA)');

  final privateKey = CryptoUtils.rsaPrivateKeyFromPem(_privateKeyPem);
  final signature = CryptoUtils.rsaSign(
    privateKey,
    base64.decode(dataToSignStructure.dataToSign),
    algorithmName: 'SHA-256/RSA',
  );
  final signedData = base64.encode(signature);

  _log('signedData: ${signedData.length} chars');

  return signedData;
}

/// 6. Hands the signature back to the server, which assembles the container.
Future<void> _signDocument(
  IAutogramService service,
  String documentId,
  DataToSignStructure dataToSignStructure,
  String signedData,
) async {
  _step(6, 'signDocument');

  final signed = await service.signDocument(
    documentId,
    SignRequestBody(
      signedData: signedData,
      dataToSignStructure: dataToSignStructure,
    ),
  );

  _log('filename: ${signed.filename}');
  _log('mimeType: ${signed.mimeType.value}');
  _log('signedBy: ${signed.signedBy}');
  _log('issuedBy: ${signed.issuedBy}');
  _log('content: ${signed.content.length} chars');
}

/// 7. Asks the server to validate the signature it just created.
///
/// The self-signed certificate has no trust anchor, so a non-`TOTAL_PASSED`
/// validation result here is the expected outcome rather than a failure.
Future<void> _getDocumentValidation(
  IAutogramService service,
  String documentId,
) async {
  _step(7, 'getDocumentValidation');

  final validation = await service.getDocumentValidation(documentId);

  _log('containerType: ${validation.containerType?.value}');
  _log('signatureForm: ${validation.signatureForm?.value}');

  final signatures = validation.signatures ?? const [];

  if (signatures.isEmpty) {
    _log('signatures: none reported');
    return;
  }

  for (final (index, signature) in signatures.indexed) {
    _log('signature #${index + 1}:');
    _log('  validationResult: ${signature.validationResult.value}');
    _log('  level: ${signature.level.value}');
    _log('  claimedSigningTime: ${signature.claimedSigningTime}');
    _log('  subjectDN: ${signature.signingCertificate.subjectDN}');
    _log('  qualification: ${signature.signingCertificate.qualification.value}');
  }
}

/// 8. Removes the document from the server.
///
/// Runs even when an earlier step failed, so the example does not leave
/// documents behind. A failure to clean up is reported but never replaces the
/// error that caused it.
Future<void> _deleteDocument(
  IAutogramService service,
  String documentId,
) async {
  _step(8, 'deleteDocument');

  try {
    await service.deleteDocument(documentId);
    _log('deleted $documentId');
  } on ServiceException catch (exception) {
    stderr.writeln('failed to delete $documentId: $exception');
  }
}

/// The [_certificatePem] as the base64 encoded DER the API expects.
String get _base64Certificate => _certificatePem
    .replaceAll('-----BEGIN CERTIFICATE-----', '')
    .replaceAll('-----END CERTIFICATE-----', '')
    .replaceAll(RegExp(r'\s'), '');

/// Reads the optional `--base-url=<url>` argument.
String _parseBaseUrl(List<String> arguments) {
  for (final argument in arguments) {
    if (argument.startsWith(_baseUrlArgument)) {
      return argument.substring(_baseUrlArgument.length);
    }
  }

  return _defaultBaseUrl;
}

void _step(int number, String name) {
  stdout.writeln('');
  stdout.writeln('$number. $name');
}

void _log(String message) {
  stdout.writeln('   $message');
}

/// Reports a [ServiceException] as parsed by `unwrap`.
void _logError(ServiceException exception) {
  stderr.writeln('');
  stderr.writeln('Request failed:');
  stderr.writeln('   statusCode: ${exception.statusCode}');
  stderr.writeln('   errorCode: ${exception.errorCode}');
  stderr.writeln('   message: ${exception.message}');
  stderr.writeln('   details: ${exception.details}');
}
