part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class OrderRaw extends BaseRaw {
  final String id;
  final String status;
  final int? tempPrice;
  final int? finalPrice;
  final OrderDetailsRaw details;
  final OrderTransactionRaw? latestTransaction;
  final List<VoucherOrderRaw>? voucherOrders;
  final StoreReviewRaw? review;

  OrderRaw({
    required this.id,
    required this.status,
    required this.tempPrice,
    required this.finalPrice,
    required this.details,
    required this.latestTransaction,
    required this.voucherOrders,
    required this.review,
  });

  factory OrderRaw.fromJson(Map<String, dynamic> json) =>
      _$OrderRawFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRawToJson(this);

  @override
  BaseModel toModel() {
    return OrderModel(
      id: id,
      status: status,
      tempPrice: tempPrice,
      finalPrice: finalPrice,
      details: details.toModel() as OrderDetailsModel,
      latestTransaction: latestTransaction?.toModel() as OrderTransactionModel?,
      voucherOrders:
          voucherOrders?.map((e) => e.toModel() as VoucherOrderModel).toList(),
      review: review?.toModel() as StoreReviewModel?,
    );
  }
}
