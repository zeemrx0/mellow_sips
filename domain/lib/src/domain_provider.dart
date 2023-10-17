import 'package:domain/src/useCases/base_use_case.dart';
import 'package:get/get.dart';

class DomainProvider {
  static void inject() {
    Get.put<GetTestUseCase>(GetTestUseCaseImpl(Get.find()));
    Get.put<GetLocalTestUseCase>(GetLocalTestUseCaseImpl(Get.find()));
    Get.put<SaveLocalTestUseCase>(SaveLocalTestUseCaseImpl(Get.find()));
    Get.put<LoginUseCase>(LoginUseCaseImpl(Get.find()));
    Get.put<RegisterUseCase>(RegisterUseCaseImpl(Get.find()));
    Get.put<VerifyRegistrationUseCase>(
      VerifyRegistrationUseCaseImpl(Get.find()),
    );
    Get.put<RequestOtpUseCase>(RequestOtpUseCaseImpl(Get.find()));

    Get.put<GetDocumentUseCase>(GetDocumentUseCaseImpl(Get.find()));

    Get.put<GetStoreListUseCase>(GetStoreListUseCaseImpl(Get.find()));
    Get.put<SearchStoresUseCase>(SearchStoresUseCaseImpl(Get.find()));
    Get.put<GetStoreMenuUseCase>(GetStoreMenuUseCaseImpl(Get.find()));
    Get.put<GetStoreDetailUseCase>(GetStoreDetailUseCaseImpl(Get.find()));

    Get.put<GetProductDetailUseCase>(GetProductDetailUseCaseImpl(Get.find()));

    Get.put<GetAllCartUseCase>(GetAllCartUseCaseImpl(Get.find()));
    Get.put<AddToCartUseCase>(AddToCartUseCaseImpl(Get.find()));
    Get.put<GetCartDetailUseCase>(GetCartDetailUseCaseImpl(Get.find()));
    Get.put<DeleteCartUseCase>(DeleteCartUseCaseImpl(Get.find()));
    Get.put<DeleteCartItemUseCase>(DeleteCartItemUseCaseImpl(Get.find()));
    
  }
}
