part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class CartModel extends BaseModel {
  final String id;
  final StoreModel store;
  final List<CartItemModel> cartItems;
  final int numberOfItems;
  final int? finalPrice;
  final int? tempPrice;

  CartModel({
    required this.id,
    required this.store,
    this.cartItems = const [],
    this.numberOfItems = 0,
    required this.finalPrice,
    required this.tempPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
