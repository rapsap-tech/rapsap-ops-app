import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/services/storage/local_storage_service.dart';

@injectable
class LocaleCubit extends Cubit<Locale> {
  new(this._storage)
    : super(Locale(_storage.languageCode ?? AppConstants.defaultLanguageCode));

  final LocalStorageService _storage;

  Future<void> setLanguage(String code) async {
    if (!AppConstants.supportedLanguageCodes.contains(code)) return;
    emit(Locale(code));
    await _storage.setLanguageCode(code);
  }
}
