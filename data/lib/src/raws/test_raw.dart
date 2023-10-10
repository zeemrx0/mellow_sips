part of './base_raw.dart';

@JsonSerializable()
@CopyWith()
class TestRaw extends BaseRaw<TestModel> {
  final String message;

  TestRaw({required this.message});

  factory TestRaw.fromJson(Map<String, dynamic> json) =>
      _$TestRawFromJson(json);

  Map<String, dynamic> toJson() => _$TestRawToJson(this);

  @override
  TestModel toModel() {
    return TestModel(
      message: message,
    );
  }
}
