
// ignore_for_file: must_be_immutable

part of 'lenguage_bloc.dart';

@immutable
sealed class LenguageState {
  List<LanguageModel> languages =
      LanguageService().getLanguagesFromJsonString();
}

class InitialLanguageState extends LenguageState {
}

//loaded state
class LoadedLanguageState extends LenguageState {
  final String languageCode;
  LoadedLanguageState(this.languageCode);

}

//error state
class ErrorLanguageState extends LenguageState {
  final String errorMessage;

  ErrorLanguageState(this.errorMessage);

}
