import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_raw.g.dart';

part './test_raw.dart';

part './app_result_raw.dart';

abstract class BaseRaw<BM extends BaseModel> {
  BM toModel();
}

class EmptyRaw extends BaseRaw<EmptyModel> {
  @override
  EmptyModel toModel() {
    return EmptyModel();
  }
}
