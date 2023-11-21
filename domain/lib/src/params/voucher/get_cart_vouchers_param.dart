part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetCartVouchersParam extends BaseParam {
  final String cartId;

  GetCartVouchersParam({
    required this.cartId,
  });

  factory GetCartVouchersParam.fromJson(Map<String, dynamic> json) =>
      _$GetCartVouchersParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartVouchersParamToJson(this);
}
