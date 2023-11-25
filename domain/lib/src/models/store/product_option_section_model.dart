part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ProductOptionSectionModel extends BaseModel {
  final String id;
  final String name;
  final int priority;
  final bool isRequired;
  final int maxAllowedChoices;
  final List<ProductAddonModel>? productAddons;

  ProductOptionSectionModel({
    required this.id,
    required this.name,
    required this.priority,
    required this.isRequired,
    required this.maxAllowedChoices,
    required this.productAddons,
  });

  factory ProductOptionSectionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionSectionModelToJson(this);
}
