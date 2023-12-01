part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderDetailsModel extends BaseModel {
  final StoreModel store;
  final List<CartItemModel> cartItems;
  final double? tempPrice;
  final double? finalPrice;

  OrderDetailsModel({
    required this.store,
    required this.cartItems,
    this.tempPrice,
    this.finalPrice,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsModelToJson(this);
}
