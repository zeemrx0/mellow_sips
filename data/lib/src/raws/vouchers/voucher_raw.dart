part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class VoucherRaw extends BaseRaw {
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
  final int? discountAmount;
  final bool? canUse;

  VoucherRaw({
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

  factory VoucherRaw.fromJson(Map<String, dynamic> json) =>
      _$VoucherRawFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherRawToJson(this);

  @override
  BaseModel toModel() {
    return VoucherModel(
      id: id,
      quantity: quantity,
      discountType: discountType,
      startDate: startDate,
      endDate: endDate,
      value: value,
      maxUsesPerUsers: maxUsesPerUsers,
      maxDiscountAmount: maxDiscountAmount,
      minOrderAmount: minOrderAmount,
      code: code,
      discountAmount: discountAmount,
      canUse: canUse,
    );
  }
}
