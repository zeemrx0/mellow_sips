part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetDocumentParam extends BaseParam {
  final String documentId;

  GetDocumentParam({
    required this.documentId,
  });

  factory GetDocumentParam.fromJson(Map<String, dynamic> json) =>
      _$GetDocumentParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetDocumentParamToJson(this);
}
