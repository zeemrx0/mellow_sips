part of '../base_use_case.dart';

abstract class GetDocumentUseCase
    extends BaseUseCase<GetDocumentParam, DocumentModel> {}

class GetDocumentUseCaseImpl extends GetDocumentUseCase {
  final DocumentRepository _documentRepository;

  GetDocumentUseCaseImpl(this._documentRepository);

  @override
  Future<AppObjectResultModel<DocumentModel>> executeObject(
          {GetDocumentParam? param}) =>
      _documentRepository.getDocument(
        params: param!.toJson(),
      );
}
