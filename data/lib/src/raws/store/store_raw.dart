part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class StoreRaw extends BaseRaw {
  final String? id;
  final String? coverImage;
  final String? name;
  final String? type;
  final bool? isOpen;
  final String? address;
  final ReviewStatisticRaw? reviewStatistic;
  final List<VoucherModel> vouchers;

  StoreRaw({
    required this.id,
    required this.coverImage,
    required this.name,
    required this.type,
    required this.isOpen,
    required this.address,
    required this.reviewStatistic,
     this.vouchers = const [],
  });

  @override
  BaseModel toModel() {
    return StoreModel(
      id: id,
      coverImage: coverImage,
      name: name,
      type: type,
      isOpen: isOpen,
      address: address,
      reviewStatistic: reviewStatistic?.toModel() as ReviewStatisticModel?,
      vouchers: vouchers,
    );
  }

  factory StoreRaw.fromJson(Map<String, dynamic> json) =>
      _$StoreRawFromJson(json);

  Map<String, dynamic> toJson() => _$StoreRawToJson(this);
}
