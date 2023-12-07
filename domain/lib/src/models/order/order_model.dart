part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderModel extends BaseModel {
  final String id;
  final String status;
  final int? tempPrice;
  final int? finalPrice;
  final OrderDetailsModel details;
  final OrderTransactionModel? latestTransaction;
  final List<VoucherOrderModel>? voucherOrders;
  final ReviewModel? review;

  OrderModel({
    required this.id,
    required this.status,
    required this.tempPrice,
    required this.finalPrice,
    required this.details,
    required this.latestTransaction,
    required this.voucherOrders,
    required this.review,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
