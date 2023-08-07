part of 'base_param.dart';

@JsonSerializable()
@CopyWith()
class TestParam extends BaseParam {
  final String? message;

  TestParam({
    this.message,
  });

  factory TestParam.fromJson(Map<String, dynamic> json) =>
      _$TestParamFromJson(json);

  Map<String, dynamic> toJson() => _$TestParamToJson(this);
}
