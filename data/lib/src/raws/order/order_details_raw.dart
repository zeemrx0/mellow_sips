part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class OrderDetailsRaw extends BaseRaw {
  final StoreRaw store;
  final List<CartItemRaw> cartItems;
  final double? tempPrice;
  final double? finalPrice;

  OrderDetailsRaw({
    required this.store,
    required this.cartItems,
    this.tempPrice,
    this.finalPrice,
  });

  factory OrderDetailsRaw.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsRawFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsRawToJson(this);

  @override
  BaseModel toModel() {
    return OrderDetailsModel(
      store: store.toModel() as StoreModel,
      tempPrice: tempPrice,
      finalPrice: finalPrice,
      cartItems: cartItems.map((e) => e.toModel() as CartItemModel).toList(),
    );
  }
}
