import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';

extension FailureMessageX on Failure {
  String message(AppLocalizations l10n) => switch (this) {
    ServerFailure() => l10n.errorServer,
    UnauthorizedFailure() => l10n.errorUnauthorized,
    ForbiddenFailure() => l10n.errorForbidden,
    NotFoundFailure() => l10n.errorNotFound,
    ValidationFailure() => l10n.errorValidation,
    InvalidOtpFailure(:final attemptsLeft) => l10n.errorOtpInvalid(
      attemptsLeft,
      AppConstants.otpLockMinutes,
    ),
    OtpLockedFailure(:final lockedMinutes) => l10n.errorOtpLocked(
      lockedMinutes,
    ),
    TooManyRequestsFailure() => l10n.errorTooManyRequests,
    DsrRejectedFailure(:final reason, :final detectedStore) => switch (reason) {
      DsrRejection.wrongStore => l10n.dsrWrongStore(detectedStore ?? ''),
      DsrRejection.unreadableDate => l10n.dsrUnreadableDate,
      DsrRejection.noSales => l10n.dsrNoSales,
      DsrRejection.tooLarge => l10n.dsrTooLarge(AppConstants.dsrMaxUploadMb),
      DsrRejection.hasMacros => l10n.dsrHasMacros,
    },
    MessageBlockedFailure(:final reason) => switch (reason) {
      BlockReason.abuse => l10n.chatBlockedAbuse,
      BlockReason.link => l10n.chatBlockedLink,
      BlockReason.flood => l10n.chatBlockedFlood,
      BlockReason.sensitive => l10n.chatBlockedSensitive,
      BlockReason.muted => l10n.chatBlockedMuted,
    },
    NoInternetFailure() => l10n.errorNoInternet,
    TimeoutFailure() => l10n.errorTimeout,
    CancelledFailure() => l10n.errorCancelled,
    ForceUpdateFailure() => l10n.errorForceUpdate,
    StorageFailure() => l10n.errorStorage,
    MediaTooLargeFailure() => l10n.errorVideoTooLarge,
    UnknownFailure() => l10n.errorUnknown,
  };
}
