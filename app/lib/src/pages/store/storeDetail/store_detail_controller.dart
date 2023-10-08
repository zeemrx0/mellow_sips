import 'dart:math';

import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/store/storeDetail/components/food_item_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './store_detail_page.dart';
part './store_detail_binding.dart';

class StoreDetailController extends GetxController {
  final GetStoreMenuUseCase _getStoreMenuUseCase;

  Rxn<MenuModel> menu = Rxn<MenuModel>();

  StoreDetailController(this._getStoreMenuUseCase);

  Future<void> getStoreMenu() async {
    try {
      final result = await _getStoreMenuUseCase.executeObject(
        param: GetStoreMenuParam(
          storeId: '0210cb7b-9613-4652-9378-9954a2564de7',
        ),
      );
      menu.value = result.netData;
    } catch (e) {
      print(e);
    }
  }
}
