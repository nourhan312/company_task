import '../api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKeys.status] ?? 0,
      errorMessage: jsonData[ApiKeys.errorMessage] ?? "Unknown Error",
    );
  }
}
