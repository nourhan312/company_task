import 'package:company_task/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor{

    @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.acceptLanguage] = "ar";
    options.headers[ApiKeys.accept] = "application/json";
    super.onRequest(options, handler);
  }

}