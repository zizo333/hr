import 'package:equatable/equatable.dart';

import '../api/status_code.dart';
import '../utils/app_strings.dart';

abstract class ApiException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const ApiException(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

class BadRequestException extends ApiException {
  const BadRequestException([String? message])
      : super(
          message ?? AppStrings.badRequestException,
          StatusCode.badRequest,
        );
}

class UnAuthorizedException extends ApiException {
  const UnAuthorizedException([String? message])
      : super(
          message ?? AppStrings.unauthorizedException,
          StatusCode.unauthorized,
        );
}

class ForbiddenException extends ApiException {
  const ForbiddenException([String? message])
      : super(
          message ?? AppStrings.forbiddenException,
          StatusCode.forbidden,
        );
}

class NotFoundException extends ApiException {
  const NotFoundException([String? message])
      : super(
          message ?? AppStrings.notFoundException,
          StatusCode.notFound,
        );
}

class TimeEndException extends ApiException {
  const TimeEndException()
      : super(
          AppStrings.timeoutException,
          StatusCode.timeout,
        );
}

class ConflictException extends ApiException {
  const ConflictException([String? message])
      : super(
          message ?? AppStrings.conflictException,
          StatusCode.conflict,
        );
}

class UnSupportedMediaTypeException extends ApiException {
  const UnSupportedMediaTypeException(String message)
      : super(message, StatusCode.unSupportedMediaType);
}

class InvalidFormatException extends ApiException {
  const InvalidFormatException()
      : super(
          AppStrings.invalidFormatException,
          StatusCode.invalidFormat,
        );
}

class NoResponseException extends ApiException {
  const NoResponseException()
      : super(
          AppStrings.noResponseException,
          StatusCode.noResponse,
        );
}

class CancelledByUserException extends ApiException {
  const CancelledByUserException(String message)
      : super(message, StatusCode.cancelledByUser);
}

class ServerErrorException extends ApiException {
  const ServerErrorException([String? message])
      : super(
          message ?? AppStrings.serverErrorException,
          StatusCode.serverError,
        );
}

class NoInternetConnectionException extends ApiException {
  const NoInternetConnectionException()
      : super(
          AppStrings.noInternetConnectionException,
          1,
        );
}

class UnKnownException extends ApiException {
  const UnKnownException([String? message, int? statusCode])
      : super(
          message ?? AppStrings.somethingWentWrongException,
          statusCode ?? 2,
        );
}

class CacheException extends ApiException {
  const CacheException(String message) : super(message, 0);
}
