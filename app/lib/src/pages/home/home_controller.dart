import 'dart:convert';

import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/orders/orderList/order_list_controller.dart';
import 'package:app/src/pages/storeList/store_list_controller.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

part './home_page.dart';

part './home_binding.dart';

class HomeController extends GetxController {
  final SubscribeNotificationsUseCase _subscribeNotificationUseCase;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  HomeController(this._subscribeNotificationUseCase);

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
    );
  }

  Future<void> subscribeNotifications() async {
    try {
      AppLoadingOverlayWidget.show();

      _flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('mellow_sips'),
        ),
      );

      await _subscribeNotificationUseCase.executeObject(
        param: SubscribeNotificationsParam(
          onReceiveGlobalNotification: (StompFrame frame) {
            _flutterLocalNotificationsPlugin.show(
              0,
              jsonDecode(frame.body!)[AppConstants.subject],
              '',
              _notificationDetails(),
            );
          },
          onReceiveUserNotification: (StompFrame frame) {
            _flutterLocalNotificationsPlugin.show(
              0,
              jsonDecode(frame.body!)[AppConstants.subject],
              '',
              _notificationDetails(),
            );
          },
        ),
      );

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
