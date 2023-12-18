import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/bottomNavPage/views/home/components/carousel_item_widget.dart';
import 'package:app/src/pages/bottomNavPage/views/home/components/product_section_item.dart';
import 'package:app/src/pages/bottomNavPage/views/home/components/store_section_item.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part './home_page.dart';

class HomeController extends GetxController {
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
    this._getDocumentUseCase,
    this._getBestSellingProductsUseCase,
    this._searchOrdersUseCase,
    this._getTokensUseCase,
    this._getAllCartUseCase,
  );

  Rx<bool> isLoggedIn = Rx<bool>(false);

  

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
}
