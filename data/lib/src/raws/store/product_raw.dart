part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ProductRaw extends BaseRaw {
  final String? id;
  final String? name;
  final String? description;
  final String storeId;
  final String? coverImage;
  final int? price;
  final List<String>? categories;
  final List<String>? tags;
  final bool? isSoldOut;
  final List<ProductOptionSectionRaw>? productOptionSections;

  ProductRaw({
    required this.id,
    required this.name,
    required this.description,
    required this.storeId,
    required this.coverImage,
    required this.price,
    required this.categories,
    required this.tags,
    required this.isSoldOut,
    this.productOptionSections,
  });

  factory ProductRaw.fromJson(Map<String, dynamic> json) =>
      _$ProductRawFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRawToJson(this);

  @override
  ProductModel toModel() => ProductModel(
        id: id,
        name: name,
        description: description,
        storeId: storeId,
        coverImage: coverImage,
        price: price,
        categories: categories,
        tags: tags,
        isSoldOut: isSoldOut,
        productOptionSections: productOptionSections
            ?.map((e) => e.toModel() as ProductOptionSectionModel)
            .toList(),
      );
}
