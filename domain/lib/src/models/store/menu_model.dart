part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class MenuModel extends BaseModel {
  final String id;
  final List<MenuSectionModel> menuSections;

  MenuModel({
    required this.id,
    required this.menuSections,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuModelToJson(this);
}
