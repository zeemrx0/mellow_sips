part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class CartModel extends BaseModel {
  final String id;
  final StoreModel store;
  final List<CartItemModel> cartItems;

  CartModel({
    required this.id,
    required this.store,
    this.cartItems = const [],
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
