part of '../base_use_case.dart';

abstract class MarkNotificationAsReadUseCase
    extends BaseUseCase<MarkNotificationAsReadParam, EmptyModel> {}

class MarkNotificationAsReadUseCaseImpl extends MarkNotificationAsReadUseCase {
  final NotificationRepository _notificationRepository;

  MarkNotificationAsReadUseCaseImpl(this._notificationRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    MarkNotificationAsReadParam? param,
  }) =>
      _notificationRepository.markAsRead(
        params: param!.toJson(),
      );
}
