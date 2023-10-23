part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderExternalPaymentInfoModel extends BaseModel {
  final String orderUrl;
  final String appTransId;
  final String appId;
  final String zpTransToken;

  OrderExternalPaymentInfoModel({
    required this.orderUrl,
    required this.appTransId,
    required this.appId,
    required this.zpTransToken,
  });

  factory OrderExternalPaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrderExternalPaymentInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderExternalPaymentInfoModelToJson(this);
}
