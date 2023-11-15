part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderTransactionModel extends BaseModel {
  final String id;
  final String? method;
  final String status;
  final String? type;
  final OrderExternalPaymentInfoModel? externalPaymentInfo;

  OrderTransactionModel({
    required this.id,
    required this.method,
    required this.status,
    required this.type,
    required this.externalPaymentInfo,
  });

  factory OrderTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$OrderTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTransactionModelToJson(this);
}
