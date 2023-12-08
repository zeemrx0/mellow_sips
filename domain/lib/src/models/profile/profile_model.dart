part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class ProfileModel extends BaseModel {
  final String id;
  final String displayName;
  final String phone;

  ProfileModel({
    required this.id,
    required this.displayName,
    required this.phone,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
