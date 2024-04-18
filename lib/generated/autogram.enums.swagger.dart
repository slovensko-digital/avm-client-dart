import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum SignDocumentResponseBodyMimeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('application/pdf;base64')
  applicationPdfBase64('application/pdf;base64'),
  @JsonValue('application/vnd.etsi.asic-e+zip;base64')
  applicationVndEtsiAsicEZipBase64('application/vnd.etsi.asic-e+zip;base64'),
  @JsonValue('application/vnd.etsi.asic-s+zip;base64')
  applicationVndEtsiAsicSZipBase64('application/vnd.etsi.asic-s+zip;base64');

  final String? value;

  const SignDocumentResponseBodyMimeType(this.value);
}

enum GetDocumentResponseBodyMimeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('application/pdf;base64')
  applicationPdfBase64('application/pdf;base64'),
  @JsonValue('application/vnd.etsi.asic-e+zip;base64')
  applicationVndEtsiAsicEZipBase64('application/vnd.etsi.asic-e+zip;base64'),
  @JsonValue('application/vnd.etsi.asic-s+zip;base64')
  applicationVndEtsiAsicSZipBase64('application/vnd.etsi.asic-s+zip;base64');

  final String? value;

  const GetDocumentResponseBodyMimeType(this.value);
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

enum SigningParametersContainerXmlns {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('http://data.gov.sk/def/container/xmldatacontainer+xml/1.1')
  httpDataGovSkDefContainerXmldatacontainerXml11(
      'http://data.gov.sk/def/container/xmldatacontainer+xml/1.1');

  final String? value;

  const SigningParametersContainerXmlns(this.value);
}

enum SigningParametersPackaging {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ENVELOPED')
  enveloped('ENVELOPED'),
  @JsonValue('ENVELOPING')
  enveloping('ENVELOPING');

  final String? value;

  const SigningParametersPackaging(this.value);
}

enum SigningParametersDigestAlgorithm {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SHA256')
  sha256('SHA256'),
  @JsonValue('SHA384')
  sha384('SHA384'),
  @JsonValue('SHA512')
  sha512('SHA512');

  final String? value;

  const SigningParametersDigestAlgorithm(this.value);
}

enum SigningParametersInfoCanonicalization {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('INCLUSIVE')
  inclusive('INCLUSIVE'),
  @JsonValue('EXCLUSIVE')
  exclusive('EXCLUSIVE'),
  @JsonValue('INCLUSIVE_WITH_COMMENTS')
  inclusiveWithComments('INCLUSIVE_WITH_COMMENTS'),
  @JsonValue('EXCLUSIVE_WITH_COMMENTS')
  exclusiveWithComments('EXCLUSIVE_WITH_COMMENTS'),
  @JsonValue('INCLUSIVE_11')
  inclusive11('INCLUSIVE_11'),
  @JsonValue('INCLUSIVE_11_WITH_COMMENTS')
  inclusive11WithComments('INCLUSIVE_11_WITH_COMMENTS');

  final String? value;

  const SigningParametersInfoCanonicalization(this.value);
}

enum SigningParametersPropertiesCanonicalization {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('INCLUSIVE')
  inclusive('INCLUSIVE'),
  @JsonValue('EXCLUSIVE')
  exclusive('EXCLUSIVE'),
  @JsonValue('INCLUSIVE_WITH_COMMENTS')
  inclusiveWithComments('INCLUSIVE_WITH_COMMENTS'),
  @JsonValue('EXCLUSIVE_WITH_COMMENTS')
  exclusiveWithComments('EXCLUSIVE_WITH_COMMENTS'),
  @JsonValue('INCLUSIVE_11')
  inclusive11('INCLUSIVE_11'),
  @JsonValue('INCLUSIVE_11_WITH_COMMENTS')
  inclusive11WithComments('INCLUSIVE_11_WITH_COMMENTS');

  final String? value;

  const SigningParametersPropertiesCanonicalization(this.value);
}

enum SigningParametersKeyInfoCanonicalization {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('INCLUSIVE')
  inclusive('INCLUSIVE'),
  @JsonValue('EXCLUSIVE')
  exclusive('EXCLUSIVE'),
  @JsonValue('INCLUSIVE_WITH_COMMENTS')
  inclusiveWithComments('INCLUSIVE_WITH_COMMENTS'),
  @JsonValue('EXCLUSIVE_WITH_COMMENTS')
  exclusiveWithComments('EXCLUSIVE_WITH_COMMENTS'),
  @JsonValue('INCLUSIVE_11')
  inclusive11('INCLUSIVE_11'),
  @JsonValue('INCLUSIVE_11_WITH_COMMENTS')
  inclusive11WithComments('INCLUSIVE_11_WITH_COMMENTS');

  final String? value;

  const SigningParametersKeyInfoCanonicalization(this.value);
}

enum SigningParametersTransformationMediaDestinationTypeDescription {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('XHTML')
  xhtml('XHTML'),
  @JsonValue('HTML')
  html('HTML'),
  @JsonValue('TXT')
  txt('TXT');

  final String? value;

  const SigningParametersTransformationMediaDestinationTypeDescription(
      this.value);
}

enum DocumentValidationResponseBodyFileFormat {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ASiC_E')
  asicE('ASiC_E'),
  @JsonValue('ASiC_S')
  asicS('ASiC_S'),
  @JsonValue('PAdES')
  pades('PAdES'),
  @JsonValue('XAdES')
  xades('XAdES');

  final String? value;

  const DocumentValidationResponseBodyFileFormat(this.value);
}

enum DocumentValidationResponseBody$Signatures$Item$ValidationResultCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(0)
  value_0(0),
  @JsonValue(1)
  value_1(1),
  @JsonValue(2)
  value_2(2);

  final int? value;

  const DocumentValidationResponseBody$Signatures$Item$ValidationResultCode(
      this.value);
}

enum DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('TOTAL_PASSED')
  totalPassed('TOTAL_PASSED'),
  @JsonValue('TOTAL_FAILED')
  totalFailed('TOTAL_FAILED'),
  @JsonValue('INDETERMINATE')
  indeterminate('INDETERMINATE');

  final String? value;

  const DocumentValidationResponseBody$Signatures$Item$ValidationResultDescription(
      this.value);
}

enum DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('XAdES_BASELINE_B')
  xadesBaselineB('XAdES_BASELINE_B'),
  @JsonValue('XAdES_BASELINE_T')
  xadesBaselineT('XAdES_BASELINE_T'),
  @JsonValue('XAdES_BASELINE_LT')
  xadesBaselineLt('XAdES_BASELINE_LT'),
  @JsonValue('XAdES_BASELINE_LTA')
  xadesBaselineLta('XAdES_BASELINE_LTA'),
  @JsonValue('PAdES_BASELINE_B')
  padesBaselineB('PAdES_BASELINE_B'),
  @JsonValue('PAdES_BASELINE_T')
  padesBaselineT('PAdES_BASELINE_T'),
  @JsonValue('PAdES_BASELINE_LT')
  padesBaselineLt('PAdES_BASELINE_LT'),
  @JsonValue('PAdES_BASELINE_LTA')
  padesBaselineLta('PAdES_BASELINE_LTA'),
  @JsonValue('CAdES_BASELINE_B')
  cadesBaselineB('CAdES_BASELINE_B'),
  @JsonValue('CAdES_BASELINE_T')
  cadesBaselineT('CAdES_BASELINE_T'),
  @JsonValue('CAdES_BASELINE_LT')
  cadesBaselineLt('CAdES_BASELINE_LT'),
  @JsonValue('CAdES_BASELINE_LTA')
  cadesBaselineLta('CAdES_BASELINE_LTA');

  final String? value;

  const DocumentValidationResponseBody$Signatures$Item$SignatureInfoLevel(
      this.value);
}

enum DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('QESIG')
  qesig('QESIG'),
  @JsonValue('QESEAL')
  qeseal('QESEAL'),
  @JsonValue('UNKNOWN_QC_QSCD-QC-QSCD')
  unknownQcQscdQcQscd('UNKNOWN_QC_QSCD-QC-QSCD'),
  @JsonValue('ADESIG_QC-QC')
  adesigQcQc('ADESIG_QC-QC'),
  @JsonValue('ADESEAL_QC-QC')
  adesealQcQc('ADESEAL_QC-QC'),
  @JsonValue('UNKNOWN_QC-QC')
  unknownQcQc('UNKNOWN_QC-QC'),
  @JsonValue('ADESIG')
  adesig('ADESIG'),
  @JsonValue('ADESEAL')
  adeseal('ADESEAL'),
  @JsonValue('UNKNOWN')
  unknown('UNKNOWN'),
  @JsonValue('INDETERMINATE_QESIG')
  indeterminateQesig('INDETERMINATE_QESIG'),
  @JsonValue('INDETERMINATE_QESEAL')
  indeterminateQeseal('INDETERMINATE_QESEAL'),
  @JsonValue('INDETERMINATE_UNKNOWN_QC_QSCD')
  indeterminateUnknownQcQscd('INDETERMINATE_UNKNOWN_QC_QSCD'),
  @JsonValue('INDETERMINATE_ADESIG_QC')
  indeterminateAdesigQc('INDETERMINATE_ADESIG_QC'),
  @JsonValue('INDETERMINATE_ADESEAL_QC')
  indeterminateAdesealQc('INDETERMINATE_ADESEAL_QC'),
  @JsonValue('INDETERMINATE_UNKNOWN_QC')
  indeterminateUnknownQc('INDETERMINATE_UNKNOWN_QC'),
  @JsonValue('INDETERMINATE_ADESIG')
  indeterminateAdesig('INDETERMINATE_ADESIG'),
  @JsonValue('INDETERMINATE_ADESEAL')
  indeterminateAdeseal('INDETERMINATE_ADESEAL'),
  @JsonValue('INDETERMINATE_UNKNOWN')
  indeterminateUnknown('INDETERMINATE_UNKNOWN'),
  @JsonValue('NOT_ADES_QC_QSCD')
  notAdesQcQscd('NOT_ADES_QC_QSCD'),
  @JsonValue('NOT_ADES_QC')
  notAdesQc('NOT_ADES_QC'),
  @JsonValue('NOT_ADES')
  notAdes('NOT_ADES'),
  @JsonValue('NA')
  na('NA');

  final String? value;

  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$SigningCertificate$QualificationDescription(
      this.value);
}

enum DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue(0)
  value_0(0),
  @JsonValue(1)
  value_1(1),
  @JsonValue(2)
  value_2(2);

  final int? value;

  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationCode(
      this.value);
}

enum DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('QTSA')
  qtsa('QTSA'),
  @JsonValue('TSA')
  tsa('TSA'),
  @JsonValue('NA')
  na('NA');

  final String? value;

  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$Item$QualificationDescription(
      this.value);
}

enum DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('CONTENT_TIMESTAMP')
  contentTimestamp('CONTENT_TIMESTAMP'),
  @JsonValue('ALL_DATA_OBJECTS_TIMESTAMP')
  allDataObjectsTimestamp('ALL_DATA_OBJECTS_TIMESTAMP'),
  @JsonValue('INDIVIDUAL_DATA_OBJECTS_TIMESTAMP')
  individualDataObjectsTimestamp('INDIVIDUAL_DATA_OBJECTS_TIMESTAMP'),
  @JsonValue('SIGNATURE_TIMESTAMP')
  signatureTimestamp('SIGNATURE_TIMESTAMP'),
  @JsonValue('VRI_TIMESTAMP')
  vriTimestamp('VRI_TIMESTAMP'),
  @JsonValue('VALIDATION_DATA_REFSONLY_TIMESTAMP')
  validationDataRefsonlyTimestamp('VALIDATION_DATA_REFSONLY_TIMESTAMP'),
  @JsonValue('VALIDATION_DATA_TIMESTAMP')
  validationDataTimestamp('VALIDATION_DATA_TIMESTAMP'),
  @JsonValue('DOCUMENT_TIMESTAMP')
  documentTimestamp('DOCUMENT_TIMESTAMP'),
  @JsonValue('ARCHIVE_TIMESTAMP')
  archiveTimestamp('ARCHIVE_TIMESTAMP');

  final String? value;

  const DocumentValidationResponseBody$Signatures$Item$SignatureInfo$Timestamps$ItemTimestampType(
      this.value);
}

enum ErrorResponseBodyCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('UNPROCESSABLE_INPUT')
  unprocessableInput('UNPROCESSABLE_INPUT'),
  @JsonValue('UNSUPPORTED_SIGNATURE_LEVEL')
  unsupportedSignatureLevel('UNSUPPORTED_SIGNATURE_LEVEL'),
  @JsonValue('MULTIPLE_ORIGINAL_DOCUMENTS')
  multipleOriginalDocuments('MULTIPLE_ORIGINAL_DOCUMENTS'),
  @JsonValue('ORIGINAL_DOCUMENT_NOT_FOUND')
  originalDocumentNotFound('ORIGINAL_DOCUMENT_NOT_FOUND'),
  @JsonValue('MALFORMED_INPUT')
  malformedInput('MALFORMED_INPUT'),
  @JsonValue('EMPTY_BODY')
  emptyBody('EMPTY_BODY'),
  @JsonValue('DATATOSIGN_MISMATCH')
  datatosignMismatch('DATATOSIGN_MISMATCH'),
  @JsonValue('CERTIFICATE_NOT_VALID')
  certificateNotValid('CERTIFICATE_NOT_VALID');

  final String? value;

  const ErrorResponseBodyCode(this.value);
}

enum EncryptionKeyNotProvidedErrorResponseBodyCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ENCRYPTION_KEY_MISSING')
  encryptionKeyMissing('ENCRYPTION_KEY_MISSING'),
  @JsonValue('ENCRYPTION_KEY_MALFORMED')
  encryptionKeyMalformed('ENCRYPTION_KEY_MALFORMED');

  final String? value;

  const EncryptionKeyNotProvidedErrorResponseBodyCode(this.value);
}

enum EncryptionKeyMismatchErrorResponseBodyCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ENCRYPTION_KEY_MISMATCH')
  encryptionKeyMismatch('ENCRYPTION_KEY_MISMATCH');

  final String? value;

  const EncryptionKeyMismatchErrorResponseBodyCode(this.value);
}

enum InternalErrorResponseBodyCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('INTERNAL_ERROR')
  internalError('INTERNAL_ERROR');

  final String? value;

  const InternalErrorResponseBodyCode(this.value);
}

enum BadGatewayErrorResponseBodyCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('UNRECOGNIZED_DSS_ERROR')
  unrecognizedDssError('UNRECOGNIZED_DSS_ERROR'),
  @JsonValue('SIGNING_FAILED')
  signingFailed('SIGNING_FAILED'),
  @JsonValue('INTERNAL_ERROR')
  internalError('INTERNAL_ERROR');

  final String? value;

  const BadGatewayErrorResponseBodyCode(this.value);
}

enum InvalidSignatureErrorResponseBodyCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('INVALID_SIGNATURE_VALUE')
  invalidSignatureValue('INVALID_SIGNATURE_VALUE'),
  @JsonValue('SIGNATURE_NOT_IN_TACT')
  signatureNotInTact('SIGNATURE_NOT_IN_TACT');

  final String? value;

  const InvalidSignatureErrorResponseBodyCode(this.value);
}
