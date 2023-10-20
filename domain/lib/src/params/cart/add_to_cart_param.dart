part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class AddToCartParam extends BaseParam {
  final String productId;
  final List<String> addons;
  final int quantity;
  final String note;

  AddToCartParam({
    required this.productId,
    required this.addons,
    required this.quantity,
    required this.note,
  });

  factory AddToCartParam.fromJson(Map<String, dynamic> json) =>
      _$AddToCartParamFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartParamToJson(this);
}
