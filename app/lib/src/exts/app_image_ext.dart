part of './app_exts.dart';

class AppImageExt {
  static Future<String?> getImage(
    GetDocumentUseCase getDocumentUseCase,
    String? imageId,
  ) async {
    if (imageId == null) return null;

    final splitId = imageId.split('|').last;

    final response = await getDocumentUseCase.executeObject(
      param: GetDocumentParam(
        documentId: splitId,
      ),
    );

    return Future.value(response.netData!.content);
  }
}
