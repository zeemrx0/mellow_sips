part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetStoreMenuParam extends BaseParam {
  final String storeId;

  GetStoreMenuParam({
    required this.storeId,
  });

  factory GetStoreMenuParam.fromJson(Map<String, dynamic> json) =>
      _$GetStoreMenuParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetStoreMenuParamToJson(this);
}
