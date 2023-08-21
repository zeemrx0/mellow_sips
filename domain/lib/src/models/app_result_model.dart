part of 'base_model.dart';

class AppObjectResultModel<BM extends BaseModel> {
  final BM? netData;

  AppObjectResultModel({required this.netData});
}

class AppListResultModel<BM extends BaseModel> {
  final List<BM>? netData;
  final bool hasMore;
  final int total;

  AppListResultModel({
    required this.netData,
    this.hasMore = false,
    this.total = 0,
  });
}
