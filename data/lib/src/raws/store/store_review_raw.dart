part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class StoreReviewRaw extends BaseRaw {
  final String id;
  final int point;
  final String? comment;

  StoreReviewRaw({
    required this.id,
    required this.point,
    required this.comment,
  });

  factory StoreReviewRaw.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewRawFromJson(json);

  Map<String, dynamic> toJson() => _$StoreReviewRawToJson(this);

  @override
  BaseModel toModel() {
    return StoreReviewModel(
      id: id,
      point: point,
      comment: comment,
    );
  }
}
