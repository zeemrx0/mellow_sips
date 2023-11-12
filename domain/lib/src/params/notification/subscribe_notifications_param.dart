part of '../base_param.dart';

class SubscribeNotificationsParam extends BaseParam {
  final Function onReceiveGlobalNotification;
  final Function onReceiveUserNotification;

  SubscribeNotificationsParam({
    required this.onReceiveGlobalNotification,
    required this.onReceiveUserNotification,
  });
}
