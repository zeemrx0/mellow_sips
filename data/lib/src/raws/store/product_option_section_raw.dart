part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ProductOptionSectionRaw extends BaseRaw {
  final String id;
  final String name;
  final int priority;
  final bool isRequired;
  final int maxAllowedChoices;
  final List<ProductAddonRaw> productAddons;

  ProductOptionSectionRaw({
    required this.id,
    required this.name,
    required this.priority,
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
      id: id,
      name: name,
      priority: priority,
      isRequired: isRequired,
      maxAllowedChoices: maxAllowedChoices,
      productAddons: productAddons.map((e) => e.toModel() as ProductAddonModel).toList(),
    );
  }
}
