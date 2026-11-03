import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const new();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const new();
}

class UnauthorizedFailure extends Failure {
  const new();
}

class ForbiddenFailure extends Failure {
  const new();
}

class NotFoundFailure extends Failure {
  const new();
}

class ValidationFailure extends Failure {
  const new(this.fieldErrors);
  final Map<String, String> fieldErrors;

  @override
  List<Object?> get props => [fieldErrors];
}

class InvalidOtpFailure extends Failure {
  const new(this.attemptsLeft);
  final int attemptsLeft;

  @override
  List<Object?> get props => [attemptsLeft];
}

class OtpLockedFailure extends Failure {
  const new(this.lockedMinutes);
  final int lockedMinutes;

  @override
  List<Object?> get props => [lockedMinutes];
}

/// Why a DSR file was refused (C22).
enum DsrRejection { wrongStore, unreadableDate, noSales, tooLarge, hasMacros }

class DsrRejectedFailure extends Failure {
  const new(this.reason, {this.detectedStore});
  final DsrRejection reason;

  /// For [DsrRejection.wrongStore]: whose DSR it looks like.
  final String? detectedStore;

  @override
  List<Object?> get props => [reason, detectedStore];
}

enum BlockReason { abuse, link, flood, sensitive, muted }

class MessageBlockedFailure extends Failure {
  const new(this.reason, {this.mutedUntil});
  final BlockReason reason;
  final DateTime? mutedUntil;

  @override
  List<Object?> get props => [reason, mutedUntil];
}

class TooManyRequestsFailure extends Failure {
  const new();
}

class NoInternetFailure extends Failure {
  const new();
}

class TimeoutFailure extends Failure {
  const new();
}

class CancelledFailure extends Failure {
  const new();
}

class ForceUpdateFailure extends Failure {
  const new();
}

class StorageFailure extends Failure {
  const new();
}

/// A recorded clip is over the upload size limit.
class MediaTooLargeFailure extends Failure {
  const new();
}

class UnknownFailure extends Failure {
  const new();
}
