part of 'app_exts.dart';

class AppExceptionExt {
  late final AppException? appException;
  final Function(AppException appException)? onError;

  AppExceptionExt({required this.appException, this.onError});

  void detected() {
    if (appException == null) {
      return AppDefaultDialogWidget()
          .setTitle('Dialog Error')
          .setContent('Application Error')
          .setAppDialogType(AppDialogType.error)
          .setPositiveText(R.strings.confirm)
          .setNegativeText(R.strings.close)
          .buildDialog(Get.context!)
          .show();
    }
    if (appException is NetworkException) {
      // General Code
      switch (appException?.statusCode) {
        case HttpStatus.unauthorized:
          // Force Logout
          return AppDefaultDialogWidget()
              .setTitle(R.strings.pleaseLoginToContinue)
              .setContent(getMessage(appException?.message))
              .setPositiveText(R.strings.confirm)
              .setAppDialogType(AppDialogType.error)
              .setOnPositive(() async {
                await _forceLogOut();
              })
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.internalServerError:
          return AppDefaultDialogWidget()
              .setTitle(R.strings.serverError)
              .setContent(getMessage(appException?.message))
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.logOut)
              .setOnPositive(() async {
                await _forceLogOut();
              })
              .setNegativeText(R.strings.close)
              .setOnNegative(() {
                Get.back();
              })
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.badRequest:
          return AppDefaultDialogWidget()
              .setTitle(R.strings.error)
              .setContent(getMessage(appException?.message))
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.gone:
          return AppDefaultDialogWidget()
              .setTitle(R.strings.error)
              .setContent(getMessage(appException?.message))
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.serviceUnavailable:
          return AppDefaultDialogWidget()
              .setTitle(R.strings.error)
              .setContent(getMessage(appException?.message))
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.gatewayTimeout:
        case HttpStatus.badGateway:
          return AppDefaultDialogWidget()
              .setTitle(R.strings.error)
              .setContent(getMessage(appException?.message))
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
        default:
          if (onError != null) {
            onError?.call(appException!);
            return;
          }

          return AppDefaultDialogWidget()
              .setTitle(R.strings.error)
              .setContent(getMessage(appException?.message))
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
      }
    }

    if (appException is LocalException) {
      Logs.d('LocalException: ${appException?.message}');
      onError?.call(appException!);
    }
  }

  Future<void> _forceLogOut() async {
    try {
      final forceLogOutUseCase = Get.find<LogoutUseCase>();
      await forceLogOutUseCase.executeObject();
      Get.offAllNamed(Routes.login);
    } on LocalException catch (e) {
      AppExceptionExt(appException: e).detected();
    }
  }

  String getMessage(String? message) {
    switch (message) {
      case AppMessage.exceededMaxAllowedItemsInCart:
        return R.strings.pleaseAddMax10Items;

      case AppMessage.qrCodeNotFound:
        return R.strings.qrCodeInvalid;

      default:
        return R.strings.systemIsCurrentlyErrorPleaseTryAgainLater;
    }
  }
}
