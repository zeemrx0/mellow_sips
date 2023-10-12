part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class CartItemModel extends BaseModel {
  final String id;
  final ProductModel product;
  final List<ProductAddonModel> addons;
  final int quantity;
  final String note;
  final int tempPrice;
  final int finalPrice;

  CartItemModel({
    required this.id,
    required this.product,
    required this.addons,
    required this.quantity,
    required this.note,
    required this.tempPrice,
    required this.finalPrice,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
