part of '../base_use_case.dart';

abstract class SubscribeNotificationsUseCase
    extends BaseUseCase<SubscribeNotificationsParam, EmptyModel> {}

class SubscribeNotificationsUseCaseImpl extends SubscribeNotificationsUseCase {
  final NotificationRepository _notificationRepository;

  SubscribeNotificationsUseCaseImpl(this._notificationRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    SubscribeNotificationsParam? param,
  }) =>
      _notificationRepository.connect(
        onReceiveGlobalNotification: param!.onReceiveGlobalNotification,
        onReceiveUserNotification: param.onReceiveUserNotification,
      );
}
