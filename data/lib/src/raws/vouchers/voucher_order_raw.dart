part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class VoucherOrderRaw extends BaseRaw {
  final String id;
  final String description;
  final int discountAmount;
  final String source;

  VoucherOrderRaw({
    required this.id,
    required this.description,
    required this.discountAmount,
    required this.source,
  });

  factory VoucherOrderRaw.fromJson(Map<String, dynamic> json) =>
      _$VoucherOrderRawFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherOrderRawToJson(this);

  @override
  BaseModel toModel() {
    return VoucherOrderModel(
      id: id,
      description: description,
      discountAmount: discountAmount,
      source: source,
    );
  }
}
