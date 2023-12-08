part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetCoffeeStoreListParam extends BaseParam {
  final int page;
  final int itemsPerPage;

  GetCoffeeStoreListParam({
    required this.page,
    required this.itemsPerPage,
  });

  factory GetCoffeeStoreListParam.fromJson(Map<String, dynamic> json) =>
      _$GetCoffeeStoreListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetCoffeeStoreListParamToJson(this);
}
