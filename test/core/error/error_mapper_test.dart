import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';

DioException _response(int status, [Object? data]) {
  final request = RequestOptions(path: '/x');
  return DioException(
    requestOptions: request,
    type: DioExceptionType.badResponse,
    response: Response<dynamic>(
      requestOptions: request,
      statusCode: status,
      data: data,
    ),
  );
}

void main() {
  test('maps status codes to typed exceptions', () {
    expect(
      ErrorMapper.toException(_response(401)),
      isA<UnauthorizedException>(),
    );
    expect(
      ErrorMapper.toException(_response(426)),
      isA<ForceUpdateException>(),
    );
    expect(ErrorMapper.toException(_response(503)), isA<ServerException>());
  });

  test('extracts field errors from 422 bodies', () {
    final e = ErrorMapper.toException(
      _response(422, {
        'errors': {
          'phone': ['invalid', 'too short'],
        },
      }),
    );
    expect((e as ValidationException).fieldErrors, {
      'phone': 'invalid, too short',
    });
  });

  test('keeps NoInternetException raised by the interceptor', () {
    final e = DioException(
      requestOptions: RequestOptions(path: '/x'),
      type: DioExceptionType.connectionError,
      error: const NoInternetException(),
    );
    expect(ErrorMapper.toException(e), isA<NoInternetException>());
  });

  test('guardFailure turns thrown errors into failures', () async {
    final result = await guardFailure<int>(
      () async => throw const NoInternetException(),
    );
    expect(result, const Left<Failure, int>(NoInternetFailure()));
    expect(await guardFailure(() async => 1), const Right<Failure, int>(1));
  });

  test('maps OTP error codes from the body', () {
    final invalid = ErrorMapper.toException(
      _response(400, {
        'code': 'otp_invalid',
        'data': {'attempts_left': 3},
      }),
    );
    expect((invalid as InvalidOtpException).attemptsLeft, 3);
    expect(
      ErrorMapper.toException(_response(423, {'code': 'otp_locked'})),
      isA<OtpLockedException>(),
    );
  });
}
