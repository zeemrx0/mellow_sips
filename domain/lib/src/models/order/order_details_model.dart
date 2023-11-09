part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderDetailsModel extends BaseModel {
  final StoreModel store;
  final List<CartItemModel> cartItems;

  OrderDetailsModel({
    required this.store,
    required this.cartItems,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsModelToJson(this);
}
