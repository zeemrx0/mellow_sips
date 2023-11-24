part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class SearchNotificationsParam extends BaseParam {
  final Map<String, dynamic> pagination;

  SearchNotificationsParam({
    required this.pagination,
  });

  factory SearchNotificationsParam.fromJson(Map<String, dynamic> json) =>
      _$SearchNotificationsParamFromJson(json);

  Map<String, dynamic> toJson() => _$SearchNotificationsParamToJson(this);
}
