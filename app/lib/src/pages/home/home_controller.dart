import 'dart:convert';
import 'dart:math';

import 'package:app/src/components/features/bottomNavigationBar/app_bottom_navigation_bar_widget.dart';
import 'package:app/src/components/features/floatingAppButton/floating_app_button.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/home/components/carousel_item_widget.dart';
import 'package:app/src/pages/home/components/product_section_item.dart';
import 'package:app/src/pages/home/components/store_section_item.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

part './home_page.dart';

part './home_binding.dart';

class HomeController extends FullLifeCycleController with FullLifeCycleMixin {
  final SubscribeNotificationsUseCase _subscribeNotificationUseCase;
  final UnsubscribeNotificationsUseCase _unsubscribeNotificationsUseCase;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final PageController pageController = PageController();

  final GetDocumentUseCase _getDocumentUseCase;
  final GetBestSellingProductsUseCase _getBestSellingProductsUseCase;
  final SearchOrdersUseCase _searchOrdersUseCase;
  final GetTokensUseCase _getTokensUseCase;
  final GetAllCartUseCase _getAllCartUseCase;

  Rxn<List<ProductModel>> bestSellingProducts = Rxn<List<ProductModel>>();
  Rxn<List<StoreModel>> orderedStores = Rxn<List<StoreModel>>();
  Rxn<List<CartModel>> carts = Rxn<List<CartModel>>();

  HomeController(
    this._subscribeNotificationUseCase,
    this._unsubscribeNotificationsUseCase,
    this._getDocumentUseCase,
    this._getBestSellingProductsUseCase,
    this._searchOrdersUseCase,
    this._getTokensUseCase,
    this._getAllCartUseCase,
  );

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

  Future<void> checkIsLoggedIn() async {
    try {
      final result = await _getTokensUseCase.executeObject();

      if (result.netData?.accessToken != null &&
          result.netData!.accessToken.isNotEmpty) {
        isLoggedIn.value = true;
        getOrderedStoreList();
        getAllCart();
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> getAllCart() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getAllCartUseCase.executeList();

      if (result.netData != null) {
        carts.value = result.netData;
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> getOrderedStoreList() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _searchOrdersUseCase.executePaginationList(
        param: SearchOrdersParam(
          criteria: {
            AppConstants.filter: {
              AppConstants.status: AppOrderStatus.received,
            },
            AppConstants.order: {
              AppConstants.createdAt: AppConstants.desc,
            },
          },
          pagination: AppListParam(
            page: 1,
            itemsPerPage: 20,
          ).toJson,
        ),
      );

      if (result.netData != null) {
        List<StoreModel> storeList = [];

        for (OrderModel order in result.netData!) {
          final store = storeList.firstWhereOrNull(
            (element) => element.id == order.details.store.id,
          );
          if (store == null) {
            order.details.store.coverImageData = await AppImageExt.getImage(
              _getDocumentUseCase,
              order.details.store.coverImage,
            );
            storeList.add(order.details.store);
          }
        }

        orderedStores.value = storeList;
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> getBestSellingProducts() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getBestSellingProductsUseCase.executePaginationList(
        param: GetBestSellingProductsParam(pagination: {
          AppConstants.page: 1,
          AppConstants.itemsPerPage: 10,
        }, criteria: {
          AppConstants.order: AppConstants.desc,
        }),
      );

      if (result.netData != null) {
        List<ProductModel> productList = [];

        for (ProductModel product in result.netData!) {
          product.coverImageData = await AppImageExt.getImage(
            _getDocumentUseCase,
            product.coverImage,
          );
          productList.add(product);
        }

        bestSellingProducts.value = productList;
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
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
