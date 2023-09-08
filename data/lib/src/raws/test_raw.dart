part of './base_raw.dart';

@JsonSerializable()
@CopyWith()
class TestRaw extends BaseRaw<TestModel> {
  final String message;

  TestRaw({required this.message});

  factory TestRaw.fromJson(Map<String, dynamic> json) =>
      _$TestRawFromJson(json);

  @override
  TestModel toModel() {
    return TestModel(
      message: message,
    );
  }
}
