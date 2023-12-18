import 'package:resources/resources.dart';

class AppMessage {
  static const String incorrectUsernameOrPassword =
      'Incorrect username or password';

  static const incorrectPhoneNumberFormat =
      "User provider does not allowed for this user type";

  static const String exceededMaxAllowedItemsInCart =
      'Exceeded max allowed items in cart';

  static const String exceededMaxAllowedAddonItemsInSection =
      "Exceeded max allowed addon items in section";

  static const String qrCodeNotFound = 'QR Code not found';

  static const String storeIsUnavailableNow = 'Store is unavailable now';

  static const String qrCodeDoesNotBelongToThisStore =
      'QR Code does not belong to this store';

  static String getErrorMessage(String? message) {
    switch (message) {
      case AppMessage.exceededMaxAllowedItemsInCart:
        return R.strings.pleaseAddMax10Items;

      case AppMessage.qrCodeNotFound:
        return R.strings.qrCodeOrSeatCodeInvalid;

      case AppMessage.qrCodeDoesNotBelongToThisStore:
        return R.strings.qrCodeDoesNotBelongToThisStore;

      case AppMessage.storeIsUnavailableNow:
        return R.strings.storeIsNotWorkingPleaseComebackLater;

      default:
        return R.strings.systemIsCurrentlyErrorPleaseTryAgainLater;
    }
  }
}
