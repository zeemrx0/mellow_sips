part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetShopListParam extends BaseParam {
  final int page;
  final int limit;

  GetShopListParam({
    required this.page,
    required this.limit,
  });

  factory GetShopListParam.fromJson(Map<String, dynamic> json) =>
      _$GetShopListParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetShopListParamToJson(this);
}
