part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetQualifiedStoreListParam extends BaseParam {
  final int page;
  final int itemsPerPage;

  GetQualifiedStoreListParam({
    required this.page,
    required this.itemsPerPage,
  });

  factory GetQualifiedStoreListParam.fromJson(Map<String, dynamic> json) =>
      _$GetQualifiedStoreListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetQualifiedStoreListParamToJson(this);
}
