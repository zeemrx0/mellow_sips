part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ProductOptionSectionModel extends BaseModel {
  final String name;
  final int order;
  final bool isRequired;
  final int maxAllowedChoices;
  final List<ProductAddonModel> productAddons;

  ProductOptionSectionModel({
    required this.name,
    required this.order,
    required this.isRequired,
    required this.maxAllowedChoices,
    required this.productAddons,
  });

  factory ProductOptionSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionSectionModelToJson(this);
}
