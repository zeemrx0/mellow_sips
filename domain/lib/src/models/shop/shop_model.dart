part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ShopModel extends BaseModel {
  final String id;
  final String avatarUrl;
  final String name;
  final String type;
  final bool hasPromotion;
  final bool isWorking;
  final double rating;
  final String address;

  ShopModel({
    required this.id,
    required this.avatarUrl,
    required this.name,
    required this.type,
    required this.hasPromotion,
    required this.isWorking,
    required this.rating,
    required this.address,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopModelToJson(this);
}
