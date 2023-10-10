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
              .setTitle('Dialog Error: ${HttpStatus.unauthorized}')
              .setContent(appException?.message)
              .setPositiveText(R.strings.confirm)
              .setAppDialogType(AppDialogType.error)
              .setOnPositive(() async {
                await _forceLogOut();
              })
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.badRequest:
        case HttpStatus.internalServerError:
        case HttpStatus.serviceUnavailable:
          return AppDefaultDialogWidget()
              .setTitle(R.strings.error)
              .setContent(appException?.message ??
                  R.strings.systemIsCurrentlyErrorPleaseTryAgainLater)
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.gatewayTimeout:
        case HttpStatus.badGateway:
          return AppDefaultDialogWidget()
              .setTitle('Dialog Error: ${appException?.statusCode}')
              .setContent(appException?.message)
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
        default:
          onError?.call(appException!);
          return;
      }
    }

    if (appException is LocalException) {
      Logs.d('LocalException: ${appException?.message}');
      onError?.call(appException!);
    }
  }

  Future<void> _forceLogOut() async {
    // TODO: Force log out
  }
}
