import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum SignDocumentResponseMimeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('application/pdf')
  applicationPdf('application/pdf'),
  @JsonValue('application/vnd.etsi.asic-e+zip')
  applicationVndEtsiAsicEZip('application/vnd.etsi.asic-e+zip'),
  @JsonValue('application/vnd.etsi.asic-s+zip')
  applicationVndEtsiAsicSZip('application/vnd.etsi.asic-s+zip');

  final String? value;

  const SignDocumentResponseMimeType(this.value);
}

enum GetDocumentResponseMimeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('application/pdf')
  applicationPdf('application/pdf'),
  @JsonValue('application/vnd.etsi.asic-e+zip')
  applicationVndEtsiAsicEZip('application/vnd.etsi.asic-e+zip'),
  @JsonValue('application/vnd.etsi.asic-s+zip')
  applicationVndEtsiAsicSZip('application/vnd.etsi.asic-s+zip');

  final String? value;

  const GetDocumentResponseMimeType(this.value);
}

enum SigningParametersLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('PAdES_BASELINE_B')
  padesBaselineB('PAdES_BASELINE_B'),
  @JsonValue('PAdES_BASELINE_T')
  padesBaselineT('PAdES_BASELINE_T'),
  @JsonValue('XAdES_BASELINE_B')
  xadesBaselineB('XAdES_BASELINE_B'),
  @JsonValue('XAdES_BASELINE_T')
  xadesBaselineT('XAdES_BASELINE_T'),
  @JsonValue('CAdES_BASELINE_B')
  cadesBaselineB('CAdES_BASELINE_B'),
  @JsonValue('CAdES_BASELINE_T')
  cadesBaselineT('CAdES_BASELINE_T');

  final String? value;

  const SigningParametersLevel(this.value);
}

enum SigningParametersContainer {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ASiC-E')
  asicE('ASiC-E'),
  @JsonValue('ASiC-S')
  asicS('ASiC-S');

  final String? value;

  const SigningParametersContainer(this.value);
}

enum DocumentsGuidVisualizationGet$ResponseMimeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('application/pdf')
  applicationPdf('application/pdf'),
  @JsonValue('text/html')
  textHtml('text/html'),
  @JsonValue('text/plain')
  textPlain('text/plain');

  final String? value;

  const DocumentsGuidVisualizationGet$ResponseMimeType(this.value);
}
