import 'package:data/src/raws/base_raw.dart';

class AppResponse {
  final int statusCode;
  final String? message;
  final String? error;
  final dynamic data;
  final int page;
  final int itemsPerPage;
  final bool hasMore;
  final int total;

  AppResponse({
    required this.statusCode,
    this.message,
    this.error,
    this.data,
    this.page = 1,
    this.itemsPerPage = 25,
    this.hasMore = false,
    this.total = 0,
  });

  factory AppResponse.fromJsonToObject(Map<String, dynamic> json) {
    return AppResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      error: json['error'],
      data: json['data'],
    );
  }

  factory AppResponse.fromJsonToList(Map<String, dynamic> json) {
    return AppResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      error: json['error'],
      data: json['data'],
    );
  }

  factory AppResponse.fromJsonToPaginationList(Map<String, dynamic> json) {
    final hasMore = json['data']['page'] * json['data']['itemsPerPage'] <
        json['data']['totalItems'];

    return AppResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      error: json['error'],
      data: json['data']['results'],
      page: json['data']['page'] ?? 1,
      itemsPerPage: json['data']['itemsPerPage'] ?? 25,
      hasMore: hasMore,
      total: json['data']['totalItems'] ?? 0,
    );
  }

  AppObjectResultRaw<BR> toObjectRaw<BR extends BaseRaw>(
    BR? Function(dynamic data) toObjectRaw,
  ) =>
      AppObjectResultRaw<BR>(
        netData: toObjectRaw.call(data),
      );

  AppListResultRaw<BR> toListRaw<BR extends BaseRaw>(
    List<BR>? Function(dynamic data) toListRaw,
  ) =>
      AppListResultRaw(
        netData: toListRaw.call(data),
      );

  AppPaginationListResultRaw<BR> toPaginationListRaw<BR extends BaseRaw>(
    List<BR>? Function(dynamic data) toPaginationListRaw,
  ) =>
      AppPaginationListResultRaw(
        netData: toPaginationListRaw.call(data),
        hasMore: hasMore,
        total: total,
      );
}
