import 'package:autogram_sign/generated/autogram.swagger.dart';

abstract class IAutogramService {
  Future<String> createDocument(DocumentPostRequestBody body);
}