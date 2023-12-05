part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetMilkTeaStoreListParam extends BaseParam {
  final int page;
  final int itemsPerPage;

  GetMilkTeaStoreListParam({
    required this.page,
    required this.itemsPerPage,
  });

  factory GetMilkTeaStoreListParam.fromJson(Map<String, dynamic> json) =>
      _$GetMilkTeaStoreListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetMilkTeaStoreListParamToJson(this);
}
