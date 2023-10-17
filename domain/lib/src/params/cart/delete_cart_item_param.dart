part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class DeleteCartItemParam extends BaseParam {
  final String cartItemId;

  DeleteCartItemParam({
    required this.cartItemId,
  });

  factory DeleteCartItemParam.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartItemParamFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCartItemParamToJson(this);
}
