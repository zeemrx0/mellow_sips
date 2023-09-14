import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_param.g.dart';
part './app_list_param.dart';
part './test_param.dart';

part './auth/login_param.dart';
part './auth/register_param.dart';
part './auth/verify_registration_param.dart';
part './auth/request_otp_param.dart';

part './shop/get_shop_list_param.dart';

abstract class BaseParam {}
