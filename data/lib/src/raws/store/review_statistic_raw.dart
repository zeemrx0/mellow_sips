part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ReviewStatisticRaw extends BaseRaw {
  final double? averagePoint;
  final int? numberOfReviews;

  ReviewStatisticRaw({
    required this.averagePoint,
    required this.numberOfReviews,
  });

  factory ReviewStatisticRaw.fromJson(Map<String, dynamic> json) =>
      _$ReviewStatisticRawFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewStatisticRawToJson(this);

  @override
  BaseModel toModel() {
    return ReviewStatisticModel(
      averagePoint: averagePoint,
      numberOfReviews: numberOfReviews,
    );
  }
}
