import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';

/// An [AuthRepository] with nobody signed in, for repositories that only
/// read the current user.
class SignedOutAuth extends Mock implements AuthRepository;
