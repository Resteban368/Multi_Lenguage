// ignore_for_file: must_be_immutable

part of 'lenguage_bloc.dart';

@immutable
sealed class LenguageState {
  final String languageCode = 'en';
  List<LanguageModel> languages = [];

  LenguageState() {
    languages = LanguageService().getLanguagesFromJsonString(languageCode);
  }
}

class InitialLanguageState extends LenguageState {}

//loaded state
class LoadedLanguageState extends LenguageState {
  // ignore: annotate_overrides, overridden_fields
  final String languageCode;
  LoadedLanguageState(this.languageCode);
}

//error state
class ErrorLanguageState extends LenguageState {
  final String errorMessage;

  ErrorLanguageState(this.errorMessage);
}
