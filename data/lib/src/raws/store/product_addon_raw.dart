part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ProductAddonRaw extends BaseRaw {
  final String id;
  final String name;
  final int price;
  final bool isSoldOut;

  ProductAddonRaw({
    required this.id,
    required this.name,
    required this.price,
    required this.isSoldOut,
  });

  factory ProductAddonRaw.fromJson(Map<String, dynamic> json) =>
      _$ProductAddonRawFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAddonRawToJson(this);

  @override
  BaseModel toModel() {
    return ProductAddonModel(
      id: id,
      name: name,
      price: price,
      isSoldOut: isSoldOut,
    );
  }
}
