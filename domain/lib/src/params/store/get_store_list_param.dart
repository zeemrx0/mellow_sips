part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetStoreListParam extends BaseParam {
  final int page;
  final int itemsPerPage;

  GetStoreListParam({
    required this.page,
    required this.itemsPerPage,
  });

  factory GetStoreListParam.fromJson(Map<String, dynamic> json) =>
      _$GetStoreListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetStoreListParamToJson(this);
}
