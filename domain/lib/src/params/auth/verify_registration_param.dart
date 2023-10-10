part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class VerifyRegistrationParam extends BaseParam {
  final String? username;
  final String? confirmationCode;

  VerifyRegistrationParam({
    this.username,
    this.confirmationCode,
  });

  factory VerifyRegistrationParam.fromJson(Map<String, dynamic> json) =>
      _$VerifyRegistrationParamFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRegistrationParamToJson(this);
}
