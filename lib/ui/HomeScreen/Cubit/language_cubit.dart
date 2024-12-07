import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohamed/Model/LanguageResponse.dart';
import 'package:mohamed/ui/SharedPreference.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  Future<void>getSavedLanguage() async {
    final String cachedLanguageCode = await LangugeCacheHelper().getCachedLanguageCode();
  //  emit(ChangeLocaleState(languageResponse: Locale(cachedLanguageCode)));
  }
  Future<void> changeLocaleState(String languageCode) async{
  await LangugeCacheHelper().cachLanguageCode(languageCode);
  //emit(ChangeLocaleState(languageResponse: Locale(languageCode)));
  }
}
