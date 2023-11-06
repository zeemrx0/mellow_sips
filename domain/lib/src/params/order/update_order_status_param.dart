part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class UpdateOrderStatusParam extends BaseParam {
  final String orderId;
  final String status;

  UpdateOrderStatusParam({
    required this.orderId,
    required this.status,
  });

  factory UpdateOrderStatusParam.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderStatusParamFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateOrderStatusParamToJson(this);
}
