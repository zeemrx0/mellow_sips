// ignore_for_file: non_constant_identifier_names

part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class VouchersModel extends BaseModel {
  final List<VoucherModel> SYSTEM;
  final List<VoucherModel> BUSINESS;

  VouchersModel({
    required this.SYSTEM,
    required this.BUSINESS,
  });

  factory VouchersModel.fromJson(Map<String, dynamic> json) =>
      _$VouchersModelFromJson(json);

  Map<String, dynamic> toJson() => _$VouchersModelToJson(this);
}
