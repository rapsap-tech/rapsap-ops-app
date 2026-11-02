import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

class ErrorMapper {
  new _();

  static const Map<String, DsrRejection> _dsrReasons = {
    'wrong_store': DsrRejection.wrongStore,
    'unreadable_date': DsrRejection.unreadableDate,
    'no_sales': DsrRejection.noSales,
    'too_large': DsrRejection.tooLarge,
    'has_macros': DsrRejection.hasMacros,
  };

  static AppException toException(Object error) {
    if (error is AppException) return error;
    if (error is DioException) return _fromDio(error);
    return const UnknownException();
  }

  static AppException _fromDio(DioException e) {
    if (e.error is AppException) return e.error! as AppException;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const RequestTimeoutException();
      case DioExceptionType.cancel:
        return const CancelledException();
      case DioExceptionType.connectionError:
        return const NoInternetException();
      case DioExceptionType.badResponse:
        return _fromStatus(e.response);
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return const UnknownException();
    }
  }

  static AppException _fromStatus(Response<dynamic>? response) {
    final body = response?.data;
    final code = body is Map ? body['code'] : null;
    final details = body is Map && body['data'] is Map
        ? body['data'] as Map
        : const <String, Object?>{};
    if (code == ApiErrorCodes.otpInvalid) {
      return InvalidOtpException(details['attempts_left'] as int? ?? 0);
    }
    if (code == ApiErrorCodes.messageBlocked) {
      final until = details['muted_until'];
      return MessageBlockedException(
        '${details['reason']}',
        mutedUntil: until is String ? DateTime.tryParse(until) : null,
      );
    }
    if (code == ApiErrorCodes.dsrRejected) {
      return DsrRejectedException(
        '${details['reason']}',
        detectedStore: details['detected_store'] as String?,
      );
    }
    if (code == ApiErrorCodes.otpLocked) {
      return OtpLockedException(
        details['locked_minutes'] as int? ?? AppConstants.otpLockMinutes,
      );
    }
    final status = response?.statusCode;
    return switch (status) {
      HttpStatusCodes.unauthorized => const UnauthorizedException(),
      HttpStatusCodes.forbidden => const ForbiddenException(),
      HttpStatusCodes.notFound => const NotFoundException(),
      HttpStatusCodes.upgradeRequired => const ForceUpdateException(),
      HttpStatusCodes.tooManyRequests => const TooManyRequestsException(),
      HttpStatusCodes.badRequest || HttpStatusCodes.unprocessableEntity =>
        ValidationException(_fieldErrors(response?.data)),
      _ => ServerException(statusCode: status),
    };
  }

  static Map<String, String> _fieldErrors(Object? body) {
    final errors = body is Map ? body['errors'] : null;
    if (errors is! Map) return const {};
    return {
      for (final entry in errors.entries)
        '${entry.key}': entry.value is List
            ? (entry.value as List).join(', ')
            : '${entry.value}',
    };
  }

  static Failure toFailure(AppException exception) => switch (exception) {
    ServerException() => const ServerFailure(),
    UnauthorizedException() => const UnauthorizedFailure(),
    ForbiddenException() => const ForbiddenFailure(),
    NotFoundException() => const NotFoundFailure(),
    ValidationException(:final fieldErrors) => ValidationFailure(fieldErrors),
    InvalidOtpException(:final attemptsLeft) => InvalidOtpFailure(attemptsLeft),
    OtpLockedException(:final lockedMinutes) => OtpLockedFailure(lockedMinutes),
    TooManyRequestsException() => const TooManyRequestsFailure(),
    DsrRejectedException(:final reason, :final detectedStore) =>
      DsrRejectedFailure(
        _dsrReasons[reason] ?? DsrRejection.unreadableDate,
        detectedStore: detectedStore,
      ),
    MessageBlockedException(:final reason, :final mutedUntil) =>
      MessageBlockedFailure(
        BlockReason.values.asNameMap()[reason] ?? BlockReason.abuse,
        mutedUntil: mutedUntil,
      ),
    NoInternetException() => const NoInternetFailure(),
    RequestTimeoutException() => const TimeoutFailure(),
    CancelledException() => const CancelledFailure(),
    ForceUpdateException() => const ForceUpdateFailure(),
    StorageException() => const StorageFailure(),
    UnknownException() => const UnknownFailure(),
  };
}

/// Runs a data-layer call and converts any thrown error into a [Failure].
Future<Either<Failure, T>> guardFailure<T>(Future<T> Function() call) async {
  try {
    return Right(await call());
  } on Object catch (error, stackTrace) {
    final exception = ErrorMapper.toException(error);
    if (exception is UnknownException) {
      appLogger.e(
        'Unexpected data error',
        error: error,
        stackTrace: stackTrace,
      );
    }
    return Left(ErrorMapper.toFailure(exception));
  }
}
