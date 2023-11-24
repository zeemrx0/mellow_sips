part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class MenuSectionModel extends BaseModel {
  final String name;
  final int priority;
  final List<ProductModel> products;

  MenuSectionModel({
    required this.name,
    required this.priority,
    required this.products,
  });

  factory MenuSectionModel.fromJson(Map<String, dynamic> json) => _$MenuSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuSectionModelToJson(this);
}