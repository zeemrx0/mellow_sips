import 'package:data/src/local/app_shared_pref.dart';
import 'package:data/src/network/network_service.dart';
import 'package:data/src/repositories/auth_repository_impl.dart';
import 'package:data/src/repositories/test_repository_impl.dart';
import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
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
  }
}
