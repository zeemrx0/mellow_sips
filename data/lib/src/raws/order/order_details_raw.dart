part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class OrderDetailsRaw extends BaseRaw {
  final StoreRaw store;
  final List<CartItemRaw> cartItems;

  OrderDetailsRaw({
    required this.store,
    required this.cartItems,
  });

  factory OrderDetailsRaw.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsRawFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsRawToJson(this);

  @override
  BaseModel toModel() {
    return OrderDetailsModel(
      store: store.toModel() as StoreModel,
      cartItems: cartItems.map((e) => e.toModel() as CartItemModel).toList(),
    );
  }
}
