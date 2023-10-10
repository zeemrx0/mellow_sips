part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class SearchStoresParam extends BaseParam {
  final dynamic criteria;
  final Map<String, dynamic> pagination;

  SearchStoresParam({
    required this.criteria,
    required this.pagination,
  });

  factory SearchStoresParam.fromJson(Map<String, dynamic> json) =>
      _$SearchStoresParamFromJson(json);

  Map<String, dynamic> toJson() => _$SearchStoresParamToJson(this);
}
