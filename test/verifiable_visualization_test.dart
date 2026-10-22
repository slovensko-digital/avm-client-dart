import 'dart:convert' show jsonDecode;

import 'package:autogram_sign/autogram_sign.dart';
import 'package:test/test.dart';

/// Tests for [VerifiableVisualizationResponseBody] JSON parsing.
void main() {
  group('VerifiableVisualizationResponseBody', () {
    test('fromJson parses PAdES visualization', () {
      final json = jsonDecode('''
{
  "signatureForm": "PAdES",
  "document": {
    "filename": "sample.pdf",
    "mimeType": "application/pdf;base64",
    "content": "JVBERi0xLjQ="
  },
  "pdfByteRange": [0, 11834, 49724, 894],
  "signingTime": 1792706057743
}''');
      final visualization = VerifiableVisualizationResponseBody.fromJson(json);

      expect(visualization.signatureForm,
          VerifiableVisualizationResponseBodySignatureForm.pades);
      expect(visualization.document.filename, "sample.pdf");
      expect(visualization.document.mimeType, "application/pdf;base64");
      expect(visualization.document.content, "JVBERi0xLjQ=");
      expect(visualization.pdfByteRange, [0, 11834, 49724, 894]);
      expect(visualization.signingTime, 1792706057743);
      expect(visualization.transformation, isNull);
      expect(visualization.asicManifest, isNull);
    });

    test('fromJson parses XAdES visualization with transformation', () {
      final json = jsonDecode('''
{
  "signatureForm": "XAdES",
  "document": {
    "filename": "general_agenda.xdcf",
    "mimeType": "application/vnd.gov.sk.xmldatacontainer+xml; charset=UTF-8;base64",
    "content": "PHhkYzpYTUxEYXRhQ29udGFpbmVyLz4="
  },
  "transformation": {
    "content": "PHhzbDpzdHlsZXNoZWV0Lz4=",
    "mediaDestinationTypeDescription": "TXT"
  }
}''');
      final visualization = VerifiableVisualizationResponseBody.fromJson(json);

      expect(visualization.signatureForm,
          VerifiableVisualizationResponseBodySignatureForm.xades);
      expect(visualization.transformation?.content, "PHhzbDpzdHlsZXNoZWV0Lz4=");
      expect(
          visualization.transformation?.mediaDestinationTypeDescription,
          VerifiableVisualizationTransformationMediaDestinationTypeDescription
              .txt);
      expect(visualization.signingTime, isNull);
    });

    test('fromJson parses CAdES visualization with ASiC manifest', () {
      final json = jsonDecode('''
{
  "signatureForm": "CAdES",
  "document": {
    "filename": "doc.txt",
    "mimeType": "text/plain; charset=UTF-8;base64",
    "content": "QWhvaiBzdmV0IQ=="
  },
  "asicManifest": {
    "filename": "META-INF/ASiCManifest001.xml",
    "mimeType": "text/xml;base64",
    "content": "PGFzaWM6QVNpQ01hbmlmZXN0Lz4="
  }
}''');
      final visualization = VerifiableVisualizationResponseBody.fromJson(json);

      expect(visualization.signatureForm,
          VerifiableVisualizationResponseBodySignatureForm.cades);
      expect(
          visualization.asicManifest?.filename, "META-INF/ASiCManifest001.xml");
    });

    test('DataToSignRequestBody serializes signingTime', () {
      expect(
        const DataToSignRequestBody(signingCertificate: "MIIC")
            .toJson()["signingTime"],
        isNull,
      );
      expect(
        const DataToSignRequestBody(
          signingCertificate: "MIIC",
          signingTime: 1792706057743,
        ).toJson()["signingTime"],
        1792706057743,
      );
    });
  });
}
