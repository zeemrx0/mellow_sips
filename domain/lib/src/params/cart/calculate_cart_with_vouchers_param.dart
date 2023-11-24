part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class CalculateCartWithVouchersParam extends BaseParam {
  final String cartId;
  final List<String> vouchers;

  CalculateCartWithVouchersParam({
    required this.cartId,
    required this.vouchers,
  });

  factory CalculateCartWithVouchersParam.fromJson(Map<String, dynamic> json) =>
      _$CalculateCartWithVouchersParamFromJson(json);

  Map<String, dynamic> toJson() => _$CalculateCartWithVouchersParamToJson(this);
}
