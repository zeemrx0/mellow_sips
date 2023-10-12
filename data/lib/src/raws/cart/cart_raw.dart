part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class CartRaw extends BaseRaw {
  final String id;
  final StoreRaw store;
  final List<CartItemRaw> cartItems;

  CartRaw({
    required this.id,
    required this.store,
    this.cartItems = const [],
  });

  factory CartRaw.fromJson(Map<String, dynamic> json) =>
      _$CartRawFromJson(json);

  Map<String, dynamic> toJson() => _$CartRawToJson(this);

  @override
  BaseModel toModel() {
    return CartModel(
      id: id,
      store: store.toModel() as StoreModel,
      cartItems: cartItems.map((e) => e.toModel() as CartItemModel).toList(),
    );
  }
}
