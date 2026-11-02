import 'package:rapsap_ops_app/core/config/env_config.dart';

class ApiConstants {
  new _();

  static String get baseUrl => EnvConfig.instance.baseUrl;
  static String get wsUrl => EnvConfig.instance.wsUrl;

  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 60);

  static const String _prefix = '/ops/api/v1';

  static const AuthEndpoints auth = AuthEndpoints._();
  static const ChecklistEndpoints checklist = ChecklistEndpoints._();
  static const TaskEndpoints tasks = TaskEndpoints._();
  static const MeEndpoints me = MeEndpoints._();
  static const ChatEndpoints chat = ChatEndpoints._();
  static const ReviewEndpoints review = ReviewEndpoints._();
  static const TeamEndpoints team = TeamEndpoints._();
  static const ReportEndpoints reports = ReportEndpoints._();
  static const DsrEndpoints dsr = DsrEndpoints._();
  static const NotificationEndpoints notifications = NotificationEndpoints._();
  static const AppEndpoints app = AppEndpoints._();
}

/// Machine-readable `code` values in error bodies (docs/api_pending.md).
class ApiErrorCodes {
  new _();

  static const String otpInvalid = 'otp_invalid';
  static const String otpLocked = 'otp_locked';
  static const String messageBlocked = 'message_blocked';
  static const String dsrRejected = 'dsr_rejected';
}

class HttpStatusCodes {
  new _();

  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int unprocessableEntity = 422;
  static const int locked = 423;
  static const int upgradeRequired = 426;
  static const int tooManyRequests = 429;
  static const int serverErrorStart = 500;
}

class AuthEndpoints {
  const new _();
  String get sendOtp => '${ApiConstants._prefix}/auth/otp/send';
  String get verifyOtp => '${ApiConstants._prefix}/auth/otp/verify';
  String get refresh => '${ApiConstants._prefix}/auth/refresh';
  String get me => '${ApiConstants._prefix}/auth/me';
  String get consent => '${ApiConstants._prefix}/auth/consent';
  String get logout => '${ApiConstants._prefix}/auth/logout';
}

class ChecklistEndpoints {
  const new _();
  String get today => '${ApiConstants._prefix}/checklist/today';
}

class TaskEndpoints {
  const new _();
  String get _base => '${ApiConstants._prefix}/tasks';
  String byId(String id) => '$_base/$id';
  String captureToken(String id) => '$_base/$id/capture-token';
  String submit(String id) => '$_base/$id/submit';
  String notDone(String id) => '$_base/$id/not-done';
}

class MeEndpoints {
  const new _();
  String get profile => '${ApiConstants._prefix}/me/profile';
  String get notificationSettings =>
      '${ApiConstants._prefix}/me/notification-settings';
}

class NotificationEndpoints {
  const new _();
  String get list => '${ApiConstants._prefix}/notifications';
  String get readAll => '$list/read-all';
  String read(String id) => '$list/$id/read';
}

class ChatEndpoints {
  const new _();
  String get _base => '${ApiConstants._prefix}/chat';
  String get conversations => '$_base/conversations';
  String get managerConversation => '$conversations/my-manager';
  String conversation(String id) => '$conversations/$id';
  String messages(String id) => '${conversation(id)}/messages';
  String photo(String id) => '${conversation(id)}/photos';
  String mute(String id) => '${conversation(id)}/mute';
  String report(String messageId) => '$_base/messages/$messageId/report';

  /// Token goes in the first frame, never in the URL (it would end up in logs).
  String get socket => '${ApiConstants.wsUrl}/chat/ws';
}

class ReviewEndpoints {
  const new _();
  String get _base => '${ApiConstants._prefix}/review';
  String get dashboard => '${ApiConstants._prefix}/manager/dashboard';
  String get queue => '$_base/queue';
  String detail(String taskId) => '$_base/$taskId';
  String verify(String taskId) => '$_base/$taskId/verify';
  String sendBack(String taskId) => '$_base/$taskId/send-back';
  String edit(String taskId) => '$_base/$taskId/edit';
  String unlock(String taskId) => '$_base/$taskId/unlock';
  String takeOver(String taskId) => '$_base/$taskId/take-over';
}

class TeamEndpoints {
  const new _();
  String get members => '${ApiConstants._prefix}/team/members';
  String get catalog => '${ApiConstants._prefix}/team/catalog';
  String member(String id) => '$members/$id';
  String resendInvite(String id) => '${member(id)}/resend-invite';
  String roles(String id) => '${member(id)}/roles';
  String numberChange(String id) => '${member(id)}/number-change';
  String numberChangeVerify(String id) => '${numberChange(id)}/verify';
  String active(String id) => '${member(id)}/active';
}

class ReportEndpoints {
  const new _();
  String get _base => '${ApiConstants._prefix}/section-reports';
  String get today => '$_base/today';
  String submit(String id) => '$_base/$id/submit';
  String snapshot(String id) => '$_base/$id/snapshot';
  String post(String id) => '${snapshot(id)}/post';
  String get dailySummary => '$_base/daily-summary';
  String get closing => '$_base/closing';
  String get walkthrough => '$_base/walkthrough';
}

class DsrEndpoints {
  const new _();
  String get _base => '${ApiConstants._prefix}/dsr';
  String get overview => '$_base/overview';
  String get check => '$_base/check';
  String save(String uploadId) => '$_base/uploads/$uploadId/save';
  String get post => '$_base/post';
}

class AppEndpoints {
  const new _();
  String get config => '${ApiConstants._prefix}/app/config';
  String get health => '${ApiConstants._prefix}/health';
}
