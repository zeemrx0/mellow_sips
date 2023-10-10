part of './base_model.dart';

@JsonSerializable()
@CopyWith()
class DocumentModel extends BaseModel {
  final String content;

  DocumentModel({
    required this.content,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);
}
