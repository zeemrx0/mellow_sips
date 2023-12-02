part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class StoreRaw extends BaseRaw {
  final String? id;
  final String? coverImage;
  final String? name;
  final String? type;
  final bool? hasPromotion;
  final bool? isOpen;
  final String? address;
  final ReviewStatisticRaw? reviewStatistic;

  StoreRaw({
    required this.id,
    required this.coverImage,
    required this.name,
    required this.type,
    required this.hasPromotion,
    required this.isOpen,
    required this.address,
    required this.reviewStatistic,
  });

  @override
  BaseModel toModel() {
    return StoreModel(
      id: id,
      coverImage: coverImage,
      name: name,
      type: type,
      hasPromotion: hasPromotion,
      isWorking: isOpen,
      address: address,
      reviewStatistic: reviewStatistic?.toModel() as ReviewStatisticModel?,
    );
  }

  factory StoreRaw.fromJson(Map<String, dynamic> json) =>
      _$StoreRawFromJson(json);

  Map<String, dynamic> toJson() => _$StoreRawToJson(this);
}
