part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class LoginParam extends BaseParam {
  final String phone;
  final String password;

  LoginParam({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginParamToJson(this);
}
