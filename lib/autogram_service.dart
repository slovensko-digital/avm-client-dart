import 'autogram_authenticator.dart';
import 'generated/autogram.swagger.dart';
import 'iautogram_service.dart';

export 'iautogram_service.dart';

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
