part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class ChangePasswordParam extends BaseParam {
  final String username;
  final String password;
  final String newPassword;

  ChangePasswordParam({
    required this.username,
    required this.password,
    required this.newPassword,
  });

  factory ChangePasswordParam.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordParamFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordParamToJson(this);
}
