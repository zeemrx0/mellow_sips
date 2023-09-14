part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ShopRaw extends BaseRaw {
  final String id;
  final String avatarUrl;
  final String name;
  final String type;
  final bool hasPromotion;
  final bool isWorking;
  final double rating;
  final String address;

  ShopRaw({
    required this.id,
    required this.avatarUrl,
    required this.name,
    required this.type,
    required this.hasPromotion,
    required this.isWorking,
    required this.rating,
    required this.address,
  });

  @override
  BaseModel toModel() {
    return ShopModel(
      id: id,
      avatarUrl: avatarUrl,
      name: name,
      type: type,
      hasPromotion: hasPromotion,
      isWorking: isWorking,
      rating: rating,
      address: address,
    );
  }

  factory ShopRaw.fromJson(Map<String, dynamic> json) =>
      _$ShopRawFromJson(json);

  Map<String, dynamic> toJson() => _$ShopRawToJson(this);
}
