part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class LoginParam extends BaseParam {
  final String username;
  final String password;

  LoginParam({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginParamToJson(this);
}
