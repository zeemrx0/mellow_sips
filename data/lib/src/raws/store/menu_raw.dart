part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class MenuRaw extends BaseRaw {
  final String id;
  final List<MenuSectionRaw> menuSections;

  MenuRaw({
    required this.id,
    required this.menuSections,
  });

  factory MenuRaw.fromJson(Map<String, dynamic> json) =>
      _$MenuRawFromJson(json);

  Map<String, dynamic> toJson() => _$MenuRawToJson(this);

  @override
  MenuModel toModel() => MenuModel(
        id: id,
        menuSections: menuSections.map((e) => e.toModel()).toList(),
      );
}
