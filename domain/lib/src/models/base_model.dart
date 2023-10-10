import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';
part './app_exception.dart';
part './app_result_model.dart';

part './test_model.dart';

part './tokens_model.dart';

part  './document_model.dart';

part 'store/store_model.dart';
part 'store/product_model.dart';
part 'store/menu_section_model.dart';
part 'store/menu_model.dart';

abstract class BaseModel {}

class EmptyModel extends BaseModel {}
