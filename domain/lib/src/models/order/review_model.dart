part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ReviewModel extends BaseModel {
  final String id;
  final int? point;
  final String? comment;

  ReviewModel({
    required this.id,
    required this.point,
    required this.comment,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
