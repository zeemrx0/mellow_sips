part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ProductOptionSectionRaw extends BaseRaw {
  final String name;
  final int order;
  final bool isRequired;
  final int maxAllowedChoices;
  final List<ProductAddonRaw> productAddons;

  ProductOptionSectionRaw({
    required this.name,
    required this.order,
    required this.isRequired,
    required this.maxAllowedChoices,
    required this.productAddons,
  });

  factory ProductOptionSectionRaw.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionSectionRawFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionSectionRawToJson(this);
  
  @override
  BaseModel toModel() {
    return ProductOptionSectionModel(
      name: name,
      order: order,
      isRequired: isRequired,
      maxAllowedChoices: maxAllowedChoices,
      productAddons: productAddons.map((e) => e.toModel() as ProductAddonModel).toList(),
    );
  }
}
