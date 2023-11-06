part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class OrderTransactionRaw extends BaseRaw {
  final String id;
  final String? method;
  final String status;
  final String? type;
  final OrderExternalPaymentInfoRaw externalPaymentInfo;

  OrderTransactionRaw({
    required this.id,
    required this.method,
    required this.status,
    required this.type,
    required this.externalPaymentInfo,
  });

  factory OrderTransactionRaw.fromJson(Map<String, dynamic> json) =>
      _$OrderTransactionRawFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTransactionRawToJson(this);

  @override
  BaseModel toModel() {
    return OrderTransactionModel(
      id: id,
      status: status,
      externalPaymentInfo: externalPaymentInfo.toModel() as OrderExternalPaymentInfoModel,
      method: method,
      type: type,
    );
  }
}
