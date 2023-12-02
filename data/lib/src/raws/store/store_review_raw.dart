part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class StoreReviewRaw extends BaseRaw {
  final String id;
  final String? createdBy;
  final int point;
  final String? comment;

  StoreReviewRaw({
    required this.id,
    required this.createdBy,
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
      createdBy: createdBy,
      point: point,
      comment: comment,
    );
  }
}
