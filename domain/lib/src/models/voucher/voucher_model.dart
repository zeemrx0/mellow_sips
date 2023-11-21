part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class VoucherModel extends BaseModel {
  final String id;
  final int quantity;
  final String discountType;
  final DateTime startDate;
  final DateTime? endDate;
  final int value;
  final int? maxUsesPerUsers;
  final int? maxDiscountAmount;
  final int? minOrderAmount;
  final String code;
  final int discountAmount;
  final bool canUse;

  VoucherModel({
    required this.id,
    required this.quantity,
    required this.discountType,
    required this.startDate,
    required this.endDate,
    required this.value,
    required this.maxUsesPerUsers,
    required this.maxDiscountAmount,
    required this.minOrderAmount,
    required this.code,
    required this.discountAmount,
    required this.canUse,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherModelToJson(this);
}
