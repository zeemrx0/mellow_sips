part of './base_raw.dart';

class AppObjectResultRaw<BR extends BaseRaw> {
  final BR? netData;

  AppObjectResultRaw({required this.netData});

  AppObjectResultModel<BM> toAppObjectResultModel<BM extends BaseModel>() =>
      AppObjectResultModel<BM>(
        netData: netData?.toModel() as BM,
      );
}

class AppListResultRaw<BR extends BaseRaw> {
  final List<BR>? netData;

  AppListResultRaw({required this.netData});

  AppListResultModel<BM> toAppListResultModel<BM extends BaseModel>() =>
      AppListResultModel<BM>(
        netData: netData?.map((e) => e.toModel() as BM).toList(),
      );
}

class AppPaginationListResultRaw<BR extends BaseRaw> {
  final List<BR>? netData;
  final bool hasMore;
  final int total;

  AppPaginationListResultRaw({
    required this.netData,
    this.hasMore = false,
    this.total = 0,
  });

  AppPaginationListResultModel<BM>
      toAppPaginationListResultModel<BM extends BaseModel>() =>
          AppPaginationListResultModel<BM>(
            netData: netData?.map((e) => e.toModel() as BM).toList(),
            hasMore: hasMore,
            total: total,
          );
}
