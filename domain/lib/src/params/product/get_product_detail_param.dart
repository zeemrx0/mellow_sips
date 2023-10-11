part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetProductDetailParam extends BaseParam {
  final String productId;

  GetProductDetailParam({
    required this.productId,
  });

  factory GetProductDetailParam.fromJson(Map<String, dynamic> json) =>
      _$GetProductDetailParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductDetailParamToJson(this);
}
