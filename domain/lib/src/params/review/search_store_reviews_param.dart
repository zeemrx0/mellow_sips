part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class SearchStoreReviewsParam extends BaseParam {
  final String storeId;
  final Map<String, dynamic> pagination;

  SearchStoreReviewsParam({
    required this.storeId,
    required this.pagination,
  });

  factory SearchStoreReviewsParam.fromJson(Map<String, dynamic> json) =>
      _$SearchStoreReviewsParamFromJson(json);

  Map<String, dynamic> toJson() => _$SearchStoreReviewsParamToJson(this);
}
