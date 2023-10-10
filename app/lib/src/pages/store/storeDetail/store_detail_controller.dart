import 'dart:convert';
import 'dart:math';

import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/store/storeDetail/components/food_item_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './store_detail_page.dart';
part './store_detail_binding.dart';

class StoreDetailController extends GetxController {
  final GetStoreMenuUseCase _getStoreMenuUseCase;
  final GetStoreDetailUseCase _getStoreDetailUseCase;
  final GetDocumentUseCase _getDocumentUseCase;

  Rxn<StoreModel> store = Rxn<StoreModel>();
  Rxn<MenuModel> menu = Rxn<MenuModel>();

  StoreDetailController(
    this._getStoreMenuUseCase,
    this._getStoreDetailUseCase,
    this._getDocumentUseCase,
  );

  Future<void> getStoreDetail() async {
    try {
      final result = await _getStoreDetailUseCase.executeObject(
        param: GetStoreDetailParam(
          storeId: '0210cb7b-9613-4652-9378-9954a2564de7',
        ),
      );

      final storeData = result.netData;

      storeData?.coverImage = await getImage(storeData.coverImage);

      store.value = storeData;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getStoreMenu() async {
    try {
      final result = await _getStoreMenuUseCase.executeObject(
        param: GetStoreDetailParam(
          storeId: '0210cb7b-9613-4652-9378-9954a2564de7',
        ),
      );

      final menuData = result.netData;

      for (MenuSectionModel section in menuData?.menuSections ?? []) {
        for (ProductModel product in section.products) {
          final image = await getImage(product.coverImage);
          product.coverImage = image;
        }
      }

      menu.value = menuData;
    } catch (e) {
      print(e);
    }
  }

  Future<String?> getImage(String? imageId) async {
    if (imageId == null) return null;

    final splitId = imageId.split('|').last;

    final response = await _getDocumentUseCase.executeObject(
      param: GetDocumentParam(
        documentId: splitId,
      ),
    );

    return Future.value(response.netData!.content);
  }
}
