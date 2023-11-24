part of '../base_remote_data_source.dart';

abstract class NotificationRemoteDataSource {
  Future<AppPaginationListResultRaw<NotificationRaw>> searchNotifications({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<EmptyRaw>> markAsRead({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<EmptyRaw>> markAllAsRead();
}

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  final NetworkService _networkService;

  NotificationRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppPaginationListResultRaw<NotificationRaw>> searchNotifications({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.searchNotifications,
          method: HttpMethod.post,
          body: params,
          requestType: RequestType.paginationList,
        ),
      );

      return remoteData.toPaginationListRaw((data) => (data as List)
          .map((item) => NotificationRaw.fromJson(item))
          .toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultRaw<EmptyRaw>> markAsRead({
    required Map<String, dynamic> params,
  }) async {
    final remoteData = await _networkService.request(
      clientRequest: ClientRequest(
        url:
            '${ApiProvider.notifications}/${params[NotificationKey.notificationId]}/mark-as-read',
        method: HttpMethod.put,
        requestType: RequestType.object,
      ),
    );

    return remoteData.toObjectRaw((data) => EmptyRaw());
  }

  @override
  Future<AppObjectResultRaw<EmptyRaw>> markAllAsRead() async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.notifications}/mark-all-as-read',
          method: HttpMethod.put,
          requestType: RequestType.object,
        ),
      );

      return remoteData.toObjectRaw((data) => EmptyRaw());
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
