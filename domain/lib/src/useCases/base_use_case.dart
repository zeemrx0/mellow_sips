import 'package:domain/domain.dart';

part 'get_test_use_case.dart';

part 'get_local_test_use_case.dart';

part 'save_local_test_use_case.dart';

part 'auth/login_use_case.dart';

part './auth/register_use_case.dart';

part './auth/verify_registration_use_case.dart';

part './auth/request_otp_use_case.dart';

abstract class BaseUseCase<In extends BaseParam, Out extends BaseModel> {
  Future<AppObjectResultModel<Out>> executeObject({In? param}) {
    return Future.value(
      AppObjectResultModel<Out>(netData: null),
    );
  }

  Future<AppListResultModel<Out>> executeList({In? param}) {
    return Future.value(
      AppListResultModel<Out>(
        netData: null,
        hasMore: false,
        total: 0,
      ),
    );
  }
}
