part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ReviewStatisticModel extends BaseModel {
  final double? averagePoint;
  final int? numberOfReviews;

  ReviewStatisticModel({
    required this.averagePoint,
    required this.numberOfReviews,
  });

  factory ReviewStatisticModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewStatisticModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewStatisticModelToJson(this);
}
