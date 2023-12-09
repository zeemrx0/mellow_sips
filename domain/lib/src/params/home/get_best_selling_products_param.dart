part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetBestSellingProductsParam extends BaseParam {
  final Map<String, dynamic> pagination;
  final Map<String, dynamic> criteria;

  GetBestSellingProductsParam({
    required this.pagination,
    required this.criteria,
  });

  factory GetBestSellingProductsParam.fromJson(Map<String, dynamic> json) =>
      _$GetBestSellingProductsParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetBestSellingProductsParamToJson(this);
}
