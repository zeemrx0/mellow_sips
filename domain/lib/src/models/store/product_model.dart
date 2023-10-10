part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ProductModel extends BaseModel {
  final String? id;
  final String? name;
  final String? description;
  String? coverImage;
  final int? price;
  final List<String>? categories;
  final List<String>? tags;
  final bool? isSoldOut;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverImage,
    required this.price,
    required this.categories,
    required this.tags,
    required this.isSoldOut,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
