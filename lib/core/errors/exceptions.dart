import 'package:dio/dio.dart';
import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        errorModel: ErrorModel(status: 408, errorMessage: "Connection Timeout"),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errorModel: ErrorModel(status: 408, errorMessage: "Send Timeout"),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errorModel: ErrorModel(status: 408, errorMessage: "Receive Timeout"),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        errorModel: ErrorModel(status: 495, errorMessage: "Bad Certificate"),
      );
    case DioExceptionType.cancel:
      throw ServerException(
        errorModel: ErrorModel(status: 0, errorMessage: "Request Cancelled"),
      );
    case DioExceptionType.connectionError:
      throw ServerException(
        errorModel: ErrorModel(status: 0, errorMessage: "Connection Error"),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel(status: 0, errorMessage: "Unknown Error"),
      );
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad Request
        case 401: // Unauthorized
        case 403: // Forbidden
        case 404: // Not Found
        case 409: // Conflict
        case 422: // Unprocessable Entity
        case 504: // Gateway Timeout
          if (e.response?.data != null) {
            throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
          }
          throw ServerException(
            errorModel: ErrorModel(
              status: e.response?.statusCode ?? 0,
              errorMessage: "Unknown Error",
            ),
          );
        default:
          throw ServerException(
            errorModel: ErrorModel(
              status: e.response?.statusCode ?? 500,
              errorMessage: "Server Error",
            ),
          );
      }
  }
}
