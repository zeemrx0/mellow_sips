part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class CartModel extends BaseModel {
  final String id;
  final StoreModel store;

  CartModel({
    required this.id,
    required this.store,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
