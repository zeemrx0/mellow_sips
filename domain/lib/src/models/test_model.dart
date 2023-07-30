part of 'base_model.dart';

@JsonSerializable()
@CopyWith()
class TestModel extends BaseModel {
  String message;

  TestModel({required this.message});
  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}
