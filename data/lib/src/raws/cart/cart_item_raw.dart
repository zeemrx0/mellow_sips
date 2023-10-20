part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class CartItemRaw extends BaseRaw {
  final String id;
  final ProductRaw product;
  final List<ProductAddonRaw> addons;
  final int quantity;
  final String note;
  final int tempPrice;
  final int finalPrice;

  CartItemRaw({
    required this.id,
    required this.product,
    required this.addons,
    required this.quantity,
    required this.note,
    required this.tempPrice,
    required this.finalPrice,
  });

  factory CartItemRaw.fromJson(Map<String, dynamic> json) =>
      _$CartItemRawFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemRawToJson(this);

  @override
  BaseModel toModel() {
    return CartItemModel(
      id: id,
      product: product.toModel(),
      addons: addons.map((e) => e.toModel() as ProductAddonModel).toList(),
      quantity: quantity,
      note: note,
      tempPrice: tempPrice,
      finalPrice: finalPrice,
    );
  }
}
