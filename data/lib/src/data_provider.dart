import 'package:data/src/local/app_shared_pref.dart';
import 'package:data/src/network/network_service.dart';
import 'package:data/src/repositories/auth_repository_impl.dart';
import 'package:data/src/repositories/cart_repository_impl.dart';
import 'package:data/src/repositories/document_repository_impl.dart';
import 'package:data/src/repositories/notification_repository_impl.dart';
import 'package:data/src/repositories/order_repository_impl.dart';
import 'package:data/src/repositories/product_repository_impl.dart';
import 'package:data/src/repositories/review_repository_impl.dart';
import 'package:data/src/repositories/store_repository_impl.dart';
import 'package:data/src/repositories/test_repository_impl.dart';
import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:data/src/sources/webSockets/notification_web_socket.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

class DataProvider {
  static Future<void> inject() async {
    final sharePref = Get.put<AppSharedPref>(AppSharedPrefImpl());
    await sharePref.onInit();
    Get.put<NetworkService>(NetworkServiceImpl());

    _DataSourcesProvider.inject();

    _RepositoriesProvider.inject();
  }
}

class _DataSourcesProvider {
  static void inject() {
    Get.lazyPut<TestRemoteDataSource>(
      () => TestRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<TestLocalDataSource>(
      () => TestLocalDataSourceImpl(Get.find()),
    );
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(Get.find()),
    );
    Get.lazyPut<DocumentRemoteDataSource>(
      () => DocumentRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<DocumentLocalDataSource>(
      () => DocumentLocalDataSourceImpl(Get.find()),
    );
    Get.lazyPut<StoreRemoteDataSource>(
      () => StoreRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<NotificationWebSocket>(
      () => NotificationWebSocket(Get.find()),
    );
    Get.lazyPut<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<ReviewRemoteDataSource>(
      () => ReviewRemoteDataSourceImpl(Get.find()),
    );
  }
}

class _RepositoriesProvider {
  static void inject() {
    Get.lazyPut<TestRepository>(
      () => TestRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<DocumentRepository>(
      () => DocumentRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<StoreRepository>(
      () => StoreRepositoryImpl(Get.find()),
    );
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(Get.find()),
    );
    Get.lazyPut<CartRepository>(
      () => CartRepositoryImpl(Get.find()),
    );
    Get.lazyPut<OrderRepository>(
      () => OrderRepositoryImpl(Get.find()),
    );
    Get.lazyPut<NotificationRepository>(
      () => NotificationRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<ReviewRepository>(
      () => ReviewRepositoryImpl(Get.find()),
    );
  }
}
