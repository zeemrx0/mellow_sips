part of 'base_raw.dart';

@JsonSerializable()
@CopyWith()
class TokensRaw extends BaseRaw<TokensModel> {
  final String accessToken;
  final String refreshToken;
  final String idToken;
  final String tokenType;
  final int expiresIn;

  TokensRaw({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
    required this.tokenType,
    required this.expiresIn,
  });

  @override
  TokensModel toModel() {
    return TokensModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      idToken: idToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
    );
  }

  factory TokensRaw.fromJson(Map<String, dynamic> json) =>
      _$TokensRawFromJson(json);

  Map<String, dynamic> toJson() => _$TokensRawToJson(this);
}
