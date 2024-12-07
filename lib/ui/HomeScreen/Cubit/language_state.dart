part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}
class ChangeLocaleState extends LanguageState {
  final LanguageResponse languageResponse ;
  ChangeLocaleState({required this.languageResponse});
}


