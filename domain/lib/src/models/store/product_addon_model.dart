part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ProductAddonModel extends BaseModel {
  final String id;
  final String name;
  final int price;
  final bool isSoldOut;

  ProductAddonModel({
    required this.id,
    required this.name,
    required this.price,
    required this.isSoldOut,
  });

  factory ProductAddonModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAddonModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAddonModelToJson(this);
}
