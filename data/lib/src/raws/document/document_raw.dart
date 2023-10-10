part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class DocumentRaw extends BaseRaw {
  final String content;

  DocumentRaw({
    required this.content,
  });

  factory DocumentRaw.fromJson(Map<String, dynamic> json) =>
      _$DocumentRawFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentRawToJson(this);

  @override
  BaseModel toModel() {
    return DocumentModel(
      content: content,
    );
  }
}
