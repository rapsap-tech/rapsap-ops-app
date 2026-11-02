import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/team/domain/repositories/team_repository.dart';

@injectable
class StartNumberChange {
  const new(this._repository);

  final TeamRepository _repository;

  Future<Either<Failure, OtpTicket>> call(String id, String phone) =>
      _repository.startNumberChange(id, phone);
}
