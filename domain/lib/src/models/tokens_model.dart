part of 'base_model.dart';

@JsonSerializable()
@CopyWith()
class TokensModel extends BaseModel {
  final String accessToken;
  final String refreshToken;
  final String idToken;
  final String tokenType;
  final int expiresIn;

  TokensModel({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) =>
      _$TokensModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokensModelToJson(this);
}
