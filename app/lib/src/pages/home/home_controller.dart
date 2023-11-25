import 'dart:convert';
import 'dart:math';

import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/home/components/carousel_item_widget.dart';
import 'package:app/src/pages/home/components/product_section_item.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

part './home_page.dart';

part './home_binding.dart';

class HomeController extends GetxController {
  final SubscribeNotificationsUseCase _subscribeNotificationUseCase;
  final UnsubscribeNotificationsUseCase _unsubscribeNotificationsUseCase;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final PageController pageController = PageController();

  final GetStoreMenuUseCase _getStoreMenuUseCase;
  final GetDocumentUseCase _getDocumentUseCase;

  Rxn<List<ProductModel>> products = Rxn<List<ProductModel>>();

  HomeController(
    this._subscribeNotificationUseCase,
    this._unsubscribeNotificationsUseCase,
    this._getStoreMenuUseCase,
    this._getDocumentUseCase,
  );

  @override
  void dispose() {
    _unsubscribeNotificationsUseCase.executeObject();
    super.dispose();
  }

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
    );
  }

  Future<void> getProducts() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getStoreMenuUseCase.executeObject(
        param: GetStoreDetailParam(
          storeId: '0210cb7b-9613-4652-9378-9954a2564de7',
        ),
      );

      final menuData = result.netData;

      List<ProductModel> productList = [];

      for (MenuSectionModel section in menuData?.menuSections ?? []) {
        for (ProductModel product in section.products) {
          product.coverImageData = await AppImageExt.getImage(
            _getDocumentUseCase,
            product.coverImage,
          );
          productList.add(product);
        }
      }

      products.value = productList;
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> subscribeNotifications() async {
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
