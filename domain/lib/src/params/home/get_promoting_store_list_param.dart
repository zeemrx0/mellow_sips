part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetPromotingStoreListParam extends BaseParam {
  final int page;
  final int itemsPerPage;

  GetPromotingStoreListParam({
    required this.page,
    required this.itemsPerPage,
  });

  factory GetPromotingStoreListParam.fromJson(Map<String, dynamic> json) =>
      _$GetPromotingStoreListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetPromotingStoreListParamToJson(this);
}
