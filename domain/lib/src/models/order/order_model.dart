part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class OrderModel extends BaseModel {
  final String id;
  final String status;

  OrderModel({
    required this.id,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
