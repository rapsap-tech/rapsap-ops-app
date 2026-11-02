import 'package:equatable/equatable.dart';

class SubmissionResult extends Equatable {
  const new({required this.submittedAt, required this.onTime});

  final DateTime submittedAt;
  final bool onTime;

  @override
  List<Object?> get props => [submittedAt, onTime];
}
