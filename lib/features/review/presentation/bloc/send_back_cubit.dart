import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/send_back_entry.dart';

enum SendBackStatus { idle, sending, sent, failure }

class SendBackState extends Equatable {
  const new({
    this.reason = '',
    this.status = SendBackStatus.idle,
    this.failure,
  });

  final String reason;
  final SendBackStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [reason, status, failure];
}

/// C4 · Send back with a required reason (SM-12).
@injectable
class SendBackCubit extends Cubit<SendBackState> {
  new(this._sendBack) : super(const SendBackState());

  final SendBackEntry _sendBack;

  void reasonChanged(String reason) {
    if (state.status == SendBackStatus.sending) return;
    emit(SendBackState(reason: reason));
  }

  Future<void> send(String taskId) async {
    if (state.status == SendBackStatus.sending) return;
    final reason = state.reason;
    emit(SendBackState(reason: reason, status: SendBackStatus.sending));
    final result = await _sendBack(taskId, reason);
    if (isClosed) return;
    emit(
      result.match(
        (f) => SendBackState(
          reason: reason,
          status: SendBackStatus.failure,
          failure: f,
        ),
        (_) => SendBackState(reason: reason, status: SendBackStatus.sent),
      ),
    );
  }
}
