part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class MenuSectionRaw extends BaseRaw {
  final String name;
  final int order;
  final List<ProductRaw> products;

  MenuSectionRaw({
    required this.name,
    required this.order,
    required this.products,
  });

  factory MenuSectionRaw.fromJson(Map<String, dynamic> json) =>
      _$MenuSectionRawFromJson(json);

  Map<String, dynamic> toJson() => _$MenuSectionRawToJson(this);

  @override
  MenuSectionModel toModel() => MenuSectionModel(
        name: name,
        order: order,
        products: products.map((e) => e.toModel()).toList(),
      );
}
