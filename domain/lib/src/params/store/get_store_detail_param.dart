part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class GetStoreDetailParam extends BaseParam {
  final String storeId;

  GetStoreDetailParam({
    required this.storeId,
  });

  factory GetStoreDetailParam.fromJson(Map<String, dynamic> json) =>
      _$GetStoreDetailParamFromJson(json);

  Map<String, dynamic> toJson() => _$GetStoreDetailParamToJson(this);
}
