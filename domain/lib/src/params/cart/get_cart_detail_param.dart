part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetCartDetailParam extends BaseParam {
  final String cartId;

  GetCartDetailParam({
    required this.cartId,
  });

  factory GetCartDetailParam.fromJson(Map<String, dynamic> json) =>
      _$GetCartDetailParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartDetailParamToJson(this);
}
