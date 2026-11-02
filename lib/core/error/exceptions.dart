sealed class AppException implements Exception {
  const new();
}

class ServerException extends AppException {
  const new({this.statusCode});
  final int? statusCode;
}

class UnauthorizedException extends AppException {
  const new();
}

class ForbiddenException extends AppException {
  const new();
}

class NotFoundException extends AppException {
  const new();
}

class ValidationException extends AppException {
  const new(this.fieldErrors);
  final Map<String, String> fieldErrors;
}

class InvalidOtpException extends AppException {
  const new(this.attemptsLeft);
  final int attemptsLeft;
}

class OtpLockedException extends AppException {
  const new(this.lockedMinutes);
  final int lockedMinutes;
}

/// Chat moderation stopped the message (CHAT-04..08).
class MessageBlockedException extends AppException {
  const new(this.reason, {this.mutedUntil});
  final String reason;
  final DateTime? mutedUntil;
}

/// The server refused a DSR file (C22).
class DsrRejectedException extends AppException {
  const new(this.reason, {this.detectedStore});
  final String reason;
  final String? detectedStore;
}

class TooManyRequestsException extends AppException {
  const new();
}

class NoInternetException extends AppException {
  const new();
}

class RequestTimeoutException extends AppException {
  const new();
}

class CancelledException extends AppException {
  const new();
}

class ForceUpdateException extends AppException {
  const new();
}

class StorageException extends AppException {
  const new();
}

class UnknownException extends AppException {
  const new();
}
