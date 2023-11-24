part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class MarkNotificationAsReadParam extends BaseParam {
  final String notificationId;

  MarkNotificationAsReadParam({
    required this.notificationId,
  });

  factory MarkNotificationAsReadParam.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationAsReadParamFromJson(json);

  Map<String, dynamic> toJson() => _$MarkNotificationAsReadParamToJson(this);
}
