part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class SearchOrdersParam extends BaseParam {
  final dynamic criteria;
  final Map<String, dynamic> pagination;

  SearchOrdersParam({
    required this.criteria,
    required this.pagination,
  });

  factory SearchOrdersParam.fromJson(Map<String, dynamic> json) =>
      _$SearchOrdersParamFromJson(json);

  Map<String, dynamic> toJson() => _$SearchOrdersParamToJson(this);
}
