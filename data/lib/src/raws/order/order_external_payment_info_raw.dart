part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class OrderExternalPaymentInfoRaw extends BaseRaw {
  final String orderUrl;
  final String appTransId;
  final String appId;
  final String zpTransToken;

  OrderExternalPaymentInfoRaw({
    required this.orderUrl,
    required this.appTransId,
    required this.appId,
    required this.zpTransToken,
  });

  factory OrderExternalPaymentInfoRaw.fromJson(Map<String, dynamic> json) =>
      _$OrderExternalPaymentInfoRawFromJson(json);

  Map<String, dynamic> toJson() => _$OrderExternalPaymentInfoRawToJson(this);

  @override
  BaseModel toModel() {
    return OrderExternalPaymentInfoModel(
      orderUrl: orderUrl,
      appTransId: appTransId,
      appId: appId,
      zpTransToken: zpTransToken,
    );
  }
}
