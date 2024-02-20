import 'package:autogram_sign/autogram_authenticator.dart';
import 'package:autogram_sign/generated/autogram.swagger.dart';
import 'package:autogram_sign/iautogram_service.dart';

class AutogramService implements IAutogramService {
  final Autogram _autogram;

  AutogramService({
    required Uri baseUrl,
    required String encryptionKey,
  }) : _autogram = Autogram.create(
    baseUrl: baseUrl,
    interceptors: [
      AutogramAuthenticator(
        encryptionKey: encryptionKey,
      ),
    ],
  );

  @override
  Future<String> createDocument(DocumentPostRequestBody body) {
    // TODO: implement createDocument
    throw UnimplementedError();
  }
}
