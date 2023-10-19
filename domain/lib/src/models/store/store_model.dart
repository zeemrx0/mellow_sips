part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class StoreModel extends BaseModel {
  final String? id;
  String? coverImage;
  String? coverImageData;
  final String? name;
  final String? type;
  final bool? hasPromotion;
  final bool? isWorking;
  final double? rating;
  final String? address;

  StoreModel({
    required this.id,
    required this.coverImage,
    this.coverImageData,
    required this.name,
    required this.type,
    required this.hasPromotion,
    required this.isWorking,
    required this.rating,
    required this.address,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
