part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class RequestOtpParam extends BaseParam {
  final String username;

  RequestOtpParam({
    required this.username,
  });

  factory RequestOtpParam.fromJson(Map<String, dynamic> json) =>
      _$RequestOtpParamFromJson(json);

  Map<String, dynamic> toJson() => _$RequestOtpParamToJson(this);
}
