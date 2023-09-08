part of './base_param.dart';

@JsonSerializable()
@CopyWith()
class AppListParam extends BaseParam {
  final int page;
  final int limit;

  AppListParam({this.page = 1, this.limit = 10});

  Map<String, dynamic> get toJson => _$AppListParamToJson(this);
}
