import 'package:data/src/network/network_service.dart';
import 'package:data/src/repositories/test_repository_impl.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

class DataProvider {
  static void inject() {
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
  }
}

class _RepositoriesProvider {
  static void inject() {
    Get.lazyPut<TestRepository>(
      () => TestRepositoryImpl(Get.find()),
    );
  }
}
