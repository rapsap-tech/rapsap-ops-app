import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// Search text for the chat list (filters the loaded list).
@injectable
class ChatSearchCubit extends Cubit<String> {
  new() : super('');

  void changed(String query) => emit(query.trim().toLowerCase());
}
