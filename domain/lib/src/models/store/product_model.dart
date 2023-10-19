part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ProductModel extends BaseModel {
  final String? id;
  final String? name;
  final String? description;
  String? coverImage;
  String? coverImageData;
  final int? price;
  final List<String>? categories;
  final List<String>? tags;
  final bool? isSoldOut;
  final List<ProductOptionSectionModel>? productOptionSections;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverImage,
    this.coverImageData,
    required this.price,
    required this.categories,
    required this.tags,
    required this.isSoldOut,
    required this.productOptionSections,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
