part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class CartRaw extends BaseRaw {
  final String id;
  final StoreRaw store;

  CartRaw({
    required this.id,
    required this.store,
  });

  factory CartRaw.fromJson(Map<String, dynamic> json) =>
      _$CartRawFromJson(json);

  Map<String, dynamic> toJson() => _$CartRawToJson(this);

  @override
  BaseModel toModel() {
    return CartModel(
      id: id,
      store: store.toModel() as StoreModel,
    );
  }
}
