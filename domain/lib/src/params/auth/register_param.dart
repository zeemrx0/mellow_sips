part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class RegisterParam extends BaseParam {
  final String username;
  final String displayName;
  final String type;
  final String password;


  RegisterParam({
    required this.username,
    required this.displayName,
    required this.type,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$RegisterParamToJson(this);
}
