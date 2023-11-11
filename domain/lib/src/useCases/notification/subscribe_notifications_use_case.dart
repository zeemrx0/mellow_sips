part of '../base_use_case.dart';

abstract class SubscribeNotificationsUseCase
    extends BaseUseCase<BaseParam, EmptyModel> {}

class SubscribeNotificationsUseCaseImpl extends SubscribeNotificationsUseCase {
  final NotificationRepository _notificationRepository;

  SubscribeNotificationsUseCaseImpl(this._notificationRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    BaseParam? param,
  }) =>
      _notificationRepository.connect();
}
