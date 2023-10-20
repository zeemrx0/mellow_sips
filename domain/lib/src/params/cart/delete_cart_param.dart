part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class DeleteCartParam extends BaseParam {
  final String cartId;

  DeleteCartParam({
    required this.cartId,
  });

  factory DeleteCartParam.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartParamFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCartParamToJson(this);
}
