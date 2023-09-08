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
  final bool hasMore;
  final int total;

  AppListResultRaw({
    required this.netData,
    this.hasMore = false,
    this.total = 0,
  });

  AppListResultModel<BM> toAppListResultModel<BM extends BaseModel>() =>
      AppListResultModel<BM>(
        netData: netData?.map((e) => e.toModel() as BM).toList(),
        hasMore: hasMore,
        total: total,
      );
}
