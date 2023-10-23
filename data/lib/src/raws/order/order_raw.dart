part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class OrderRaw extends BaseRaw {
  final String id;
  final String status;

  OrderRaw({
    required this.id,
    required this.status,
  });

  factory OrderRaw.fromJson(Map<String, dynamic> json) =>
      _$OrderRawFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRawToJson(this);

  @override
  BaseModel toModel() {
    return OrderModel(
      id: id,
      status: status,
    );
  }
}
