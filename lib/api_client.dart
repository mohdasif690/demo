import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptor());
    _dio.options.baseUrl = "https://reqres.in/";
    return _dio;
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }
}
