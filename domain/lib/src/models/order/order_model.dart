part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderModel extends BaseModel {
  final String id;
  final String status;
  final OrderExternalPaymentInfoModel externalPaymentInfo;

  OrderModel({
    required this.id,
    required this.status,
    required this.externalPaymentInfo,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
