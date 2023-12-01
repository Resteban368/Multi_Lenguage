part of 'lenguage_bloc.dart';

@immutable
sealed class LenguageEvent {}


class GetLanguageEvent extends LenguageEvent {


}


class ChangeLanguageEvent extends LenguageEvent {
  final String languageCode;
  final BuildContext context;

  ChangeLanguageEvent(this.languageCode, this.context);

  List<Object> get props => [languageCode, context];
}


