import 'package:data/src/raws/app_response.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:configs/configs.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'api_provider.dart';

part 'client_request.dart';

abstract class NetworkService extends GetxService {
  static Dio getNewDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: BuildConfig.apiDomain,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
    ));
    return dio;
  }

  Future<AppResponse> request({required ClientRequest clientRequest});
}

class NetworkServiceImpl extends NetworkService {
  late Dio _dio;

  @override
  void onInit() {
    _dio = NetworkService.getNewDio();
    super.onInit();
  }

  @override
  Future<AppResponse> request({required ClientRequest clientRequest}) async {
    try {
      final response = await _dio.request(
        clientRequest.url,
        data: clientRequest.body,
        queryParameters: clientRequest.queryParameters,
        options: Options(
          method: clientRequest.method.value,
          headers: clientRequest.headers,
          contentType: clientRequest.contentType,
        ),
        onSendProgress: clientRequest.onSendProgress,
        onReceiveProgress: clientRequest.onReceiveProgress,
      );
      final AppResponse appResponse = clientRequest.isRequestedForList
          ? AppResponse.fromJsonToList(response.data)
          : AppResponse.fromJsonToObject(response.data);

      return HttpStatus(response.statusCode).isOk
          ? appResponse
          : throw NetworkException(
              statusCode: response.statusCode,
              message: appResponse.message,
              error: appResponse.error,
            );
    } on DioException catch (e) {
      throw NetworkException(
        statusCode: e.response?.statusCode,
        message: e.response?.data['message'],
        error: ErrorCode.dioError,
      );
    } catch (e) {
      throw NetworkException(
        statusCode: StatusCode.code999,
        message: 'Something went wrong ${e.toString()}',
        error: ErrorCode.networkServiceError,
      );
    }
  }
}
