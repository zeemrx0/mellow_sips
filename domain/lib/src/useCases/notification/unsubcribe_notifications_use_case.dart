part of '../base_use_case.dart';

abstract class UnsubscribeNotificationsUseCase
    extends BaseUseCase<BaseParam, EmptyModel> {}

class UnsubscribeNotificationsUseCaseImpl
    extends UnsubscribeNotificationsUseCase {
  final NotificationRepository _notificationRepository;

  UnsubscribeNotificationsUseCaseImpl(this._notificationRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    BaseParam? param,
  }) =>
      _notificationRepository.disconnect();
}
