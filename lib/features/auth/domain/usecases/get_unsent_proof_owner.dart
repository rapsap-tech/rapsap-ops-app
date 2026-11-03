import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';

typedef UnsentProofOwner = ({String name, int count});

/// Who left proof on this device that isn't uploaded yet. Signing in as
/// anyone else deletes it, so the login screen warns about it.
@injectable
class GetUnsentProofOwner {
  const new(this._auth, this._outbox);

  final AuthRepository _auth;
  final UploadOutboxRepository _outbox;

  UnsentProofOwner? call() {
    final user = _auth.lastSignedInUser();
    final count = _outbox.pending().getOrElse((_) => const []).length;
    if (user == null || count == 0) return null;
    return (name: user.name, count: count);
  }
}
