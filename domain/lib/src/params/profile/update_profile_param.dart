part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class UpdateProfileParam extends BaseParam {
  final String? displayName;
  final String? phone;

  UpdateProfileParam({
    this.displayName,
    this.phone,
  });

  factory UpdateProfileParam.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileParamFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileParamToJson(this);
}
