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

  final String? address;
  final ReviewStatisticModel? reviewStatistic;

  StoreModel({
    required this.id,
    required this.coverImage,
    this.coverImageData,
    required this.name,
    required this.type,
    required this.hasPromotion,
    required this.isWorking,
    required this.address,
    required this.reviewStatistic,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
