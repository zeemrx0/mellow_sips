part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class VoucherOrderModel extends BaseModel {
  final String id;
  final String description;
  final int discountAmount;
  final String source;

  VoucherOrderModel({
    required this.id,
    required this.description,
    required this.discountAmount,
    required this.source,
  });

  factory VoucherOrderModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherOrderModelToJson(this);
}
