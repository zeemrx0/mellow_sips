import 'package:domain/src/useCases/base_use_case.dart';
import 'package:get/get.dart';

class DomainProvider {
  static void inject() {
    Get.put<GetTestUseCase>(GetTestUseCaseImpl(Get.find()));
    Get.put<GetLocalTestUseCase>(GetLocalTestUseCaseImpl(Get.find()));
    Get.put<SaveLocalTestUseCase>(SaveLocalTestUseCaseImpl(Get.find()));
    Get.put<LoginUseCase>(LoginUseCaseImpl(Get.find()));
    Get.put<RegisterUseCase>(RegisterUseCaseImpl(Get.find()));
  }
}
