// ignore_for_file: avoid_print, depend_on_referenced_packages, use_build_context_synchronously, unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:multi_lenguages/app/features/home/data/services/language_service.dart';

import '../../data/models/language_model.dart';
import '../../data/repository/language_selector_service.dart';

part 'lenguage_event.dart';
part 'lenguage_state.dart';





// class LenguageBloc extends Bloc<LenguageEvent, LenguageState> {
//   final _appLanguageService = AppLanguageService();
//   final BuildContext context;

//   LenguageBloc(this.context) : super(InitialLanguageState()) {
//     print('LenguageBloc');

//     on<GetLanguageEvent>((event, emit) async {
//       print('GetLanguageEvent');
//       try {
//         final String? languageCode = await _appLanguageService.getAppLanguage();

//         if (languageCode == null) {
//           add(ChangeLanguageEvent('en', context));
//         } else {
//           await _appLanguageService.changeAppLanguage(languageCode, context);
//         }
//         // emit(LoadedLanguageState(languageCode ?? 'en'));
//       } catch (e, s) {
//         emit(ErrorLanguageState('Error getting language + $s'));
//       }
//     });

//     on<ChangeLanguageEvent>((event, emit) async {
//       print('ChangeLanguageEvent');
//       try {
//         await _appLanguageService.setAndChangeAppLanguage(
//             event.languageCode, event.context);
//         emit(LoadedLanguageState(event.languageCode));
//       } catch (e, s) {
//         emit(ErrorLanguageState('Error changing language + $s'));
//       }
//     });

//     // Agregar el evento GetLanguageEvent al inicio.
//     add(GetLanguageEvent());
//   }
// }














class LenguageBloc extends Bloc<LenguageEvent, LenguageState> {
  final _appLanguageService = AppLanguageService();

  LenguageBloc() : super(InitialLanguageState()) {
    print('LenguageBloc');

    on<GetLanguageEvent>((event, emit) async {
      print('GetLanguageEvent');
      try {
        final String? languageCode = await _appLanguageService.getAppLanguage();
        emit(LoadedLanguageState(languageCode ?? 'en'));
      } catch (e, s) {
        emit(ErrorLanguageState('Error getting language + $s'));
      }
    });

    on<ChangeLanguageEvent>((event, emit) async {
      print('ChangeLanguageEvent');
      try {
        await _appLanguageService.setAndChangeAppLanguage(
            event.languageCode, event.context);
        emit(LoadedLanguageState(event.languageCode));
      } catch (e, s) {
        emit(ErrorLanguageState('Error changing language + $s'));
      }
    });

    // Agregar el evento GetLanguageEvent al inicio.
    add(GetLanguageEvent());
  }
}
