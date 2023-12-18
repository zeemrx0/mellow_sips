part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class CreateStoreReviewParam extends BaseParam {
  final String orderId;
  final int point;
  final String? comment;

  CreateStoreReviewParam({
    required this.orderId,
    required this.point,
    required this.comment,
  });

  factory CreateStoreReviewParam.fromJson(Map<String, dynamic> json) =>
      _$CreateStoreReviewParamFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStoreReviewParamToJson(this);
}
