part of '../base_use_case.dart';

abstract class MarkAllNotificationAsReadUseCase
    extends BaseUseCase<BaseParam, EmptyModel> {}

class MarkAllNotificationAsReadUseCaseImpl
    extends MarkAllNotificationAsReadUseCase {
  final NotificationRepository _notificationRepository;

  MarkAllNotificationAsReadUseCaseImpl(this._notificationRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    BaseParam? param,
  }) =>
      _notificationRepository.markAllAsRead();
}
