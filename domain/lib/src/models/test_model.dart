part of './base_model.dart';

@JsonSerializable()
@CopyWith()
class TestModel extends BaseModel {
  String message;

  TestModel({required this.message});

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}
