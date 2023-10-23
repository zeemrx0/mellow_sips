part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetOrderDetailParam extends BaseParam {
  final String orderId;

  GetOrderDetailParam({
    required this.orderId,
  });

  factory GetOrderDetailParam.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetailParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderDetailParamToJson(this);
}
