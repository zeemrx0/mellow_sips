import 'dart:convert';

import 'package:app/src/components/features/bottomNavigationBar/app_bottom_navigation_bar_controller.dart';
import 'package:app/src/components/features/floatingAppButton/floating_app_button.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/bottomNavPage/views/appMenu/app_nav_menu_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/home/home_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/notification/notification_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/controllers/cancelled_order_list_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/controllers/completed_order_list_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/controllers/preparing_order_list_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/controllers/received_order_list_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/controllers/waiting_for_confirm_order_list_controller.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/order_list_controller.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

part './bottom_nav_page.dart';
part './bottom_nav_binding.dart';

class BottomNavController extends FullLifeCycleController
    with FullLifeCycleMixin {
  final SubscribeNotificationsUseCase _subscribeNotificationUseCase;
  final UnsubscribeNotificationsUseCase _unsubscribeNotificationsUseCase;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  BottomNavController(
    this._subscribeNotificationUseCase,
    this._unsubscribeNotificationsUseCase,
  );

  final pageController = PageController();
  Rx<bool> isLoggedIn = Rx<bool>(false);

  @override
  void onDetached() {
    _unsubscribeNotificationsUseCase.executeObject();
  }

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

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
    print('subscribeNotifications');
    try {
      AppLoadingOverlayWidget.show();

      bool isNotificationEnabled = await _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      if (!isNotificationEnabled) {
        isNotificationEnabled = await _flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>()
                ?.requestNotificationsPermission() ??
            false;

        if (!isNotificationEnabled) {
          AppDefaultDialogWidget()
              .setTitle(R.strings.notificationIsNotEnabled)
              .setContent(R.strings
                  .PleaseEnableNotificationSoThatWeCanNotifyWhenOrderCompleted)
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setOnPositive(() async {
                Get.back();
              })
              .buildDialog(Get.context!)
              .show();
        }
      }

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

            if (jsonDecode(frame.body!)[AppConstants.key] ==
                AppConstants.orderCompleted) {
              Get.toNamed(
                Routes.orderCompletedAlert,
                arguments: jsonDecode(frame.body!)[AppConstants.metadata]
                    [AppConstants.orderId],
              );
            }
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
