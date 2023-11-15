part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetTransactionByOrderIdParam extends BaseParam {
  final String orderId;

  GetTransactionByOrderIdParam({
    required this.orderId,
  });

  factory GetTransactionByOrderIdParam.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionByOrderIdParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionByOrderIdParamToJson(this);
}
