part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class StoreReviewModel extends BaseModel {
  final String id;
  final int point;
  final String? comment;

  StoreReviewModel({
    required this.id,
    required this.point,
    required this.comment,
  });

  factory StoreReviewModel.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreReviewModelToJson(this);
}
