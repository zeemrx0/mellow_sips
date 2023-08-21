part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class RequestOtpParam extends BaseParam {
  final String username;

  RequestOtpParam({
    required this.username,
  });

  Map<String, dynamic> toJson() => _$RequestOtpParamToJson(this);
}
