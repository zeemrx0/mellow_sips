// ignore_for_file: non_constant_identifier_names

part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class VouchersRaw extends BaseRaw {
  final List<VoucherRaw> SYSTEM;
  final List<VoucherRaw> BUSINESS;

  VouchersRaw({
    required this.SYSTEM,
    required this.BUSINESS,
  });

  factory VouchersRaw.fromJson(Map<String, dynamic> json) =>
      _$VouchersRawFromJson(json);

  Map<String, dynamic> toJson() => _$VouchersRawToJson(this);

  @override
  BaseModel toModel() {
    return VouchersModel(
      SYSTEM: SYSTEM.map((e) => e.toModel() as VoucherModel).toList(),
      BUSINESS: BUSINESS.map((e) => e.toModel() as VoucherModel).toList(),
    );
  }
}
