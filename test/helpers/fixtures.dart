import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';

const User testUser = User(
  id: 'u1',
  name: 'Priya',
  role: UserRole.staff,
  jobRoles: ['Housekeeping'],
  storeName: 'Store',
  consentAccepted: true,
);

const OtpTicket testTicket = OtpTicket(resendAfterSeconds: 2, validMinutes: 5);
