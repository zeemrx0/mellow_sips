part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class MenuSectionRaw extends BaseRaw {
  final String name;
  final int priority;
  final List<ProductRaw> products;

  MenuSectionRaw({
    required this.name,
    required this.priority,
    required this.products,
  });

  factory MenuSectionRaw.fromJson(Map<String, dynamic> json) =>
      _$MenuSectionRawFromJson(json);

  Map<String, dynamic> toJson() => _$MenuSectionRawToJson(this);

  @override
  MenuSectionModel toModel() => MenuSectionModel(
        name: name,
        priority: priority,
        products: products.map((e) => e.toModel()).toList(),
      );
}
