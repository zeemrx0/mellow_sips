part of '../base_param.dart';

@JsonSerializable()
@CopyWith()
class UpdateCartItemParam extends BaseParam {
  final String cartItemId;
  final List<String> addons;
  final int quantity;
  final String note;

  UpdateCartItemParam({
    required this.cartItemId,
    required this.addons,
    required this.quantity,
    required this.note,
  });

  factory UpdateCartItemParam.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartItemParamFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartItemParamToJson(this);
}
