part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ReviewRaw extends BaseRaw {
  final String id;
  final int? point;
  final String? comment;

  ReviewRaw({
    required this.id,
    required this.point,
    required this.comment,
  });

  factory ReviewRaw.fromJson(Map<String, dynamic> json) =>
      _$ReviewRawFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewRawToJson(this);

  @override
  BaseModel toModel() {
    return ReviewModel(
      id: id,
      point: point,
      comment: comment,
    );
  }
}
