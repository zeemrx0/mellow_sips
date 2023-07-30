part of 'base_model.dart';

abstract class AppException implements Exception {
  final int? statusCode;
  final String? message;
  final String? error;

  AppException({
    required this.statusCode,
    required this.message,
    this.error,
  });
}

class NetworkException extends AppException {
  NetworkException({
    required super.statusCode,
    required super.message,
    super.error,
  });
}
