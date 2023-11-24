part of '../base_use_case.dart';

abstract class SearchNotificationsUseCase
    extends BaseUseCase<SearchNotificationsParam, NotificationModel> {}

class SearchNotificationsUseCaseImpl extends SearchNotificationsUseCase {
  final NotificationRepository _storeRepository;

  SearchNotificationsUseCaseImpl(this._storeRepository);

  @override
  Future<AppPaginationListResultModel<NotificationModel>>
      executePaginationList({
    SearchNotificationsParam? param,
  }) {
    return _storeRepository.searchNotifications(params: param!.toJson());
  }
}
