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

  Map<String, dynamic> toJson() => _$VerifyRegistrationParamToJson(this);
}
