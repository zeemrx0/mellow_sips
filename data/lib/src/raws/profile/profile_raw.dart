part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class ProfileRaw extends BaseRaw {
  final String id;
  final String displayName;
  final String phone;

  ProfileRaw({
    required this.id,
    required this.displayName,
    required this.phone,
  });

  factory ProfileRaw.fromJson(Map<String, dynamic> json) =>
      _$ProfileRawFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRawToJson(this);

  @override
  BaseModel toModel() {
    return ProfileModel(
      id: id,
      displayName: displayName,
      phone: phone,
    );
  }
}
