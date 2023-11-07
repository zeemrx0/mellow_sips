part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderModel extends BaseModel {
  final String id;
  final String status;
  final int finalPrice;
  final OrderDetailsModel details;
  final OrderTransactionModel? latestTransaction;

  OrderModel({
    required this.id,
    required this.status,
    required this.finalPrice,
    required this.details,
    required this.latestTransaction,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
