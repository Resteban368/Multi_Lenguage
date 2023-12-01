// ignore_for_file: use_build_context_synchronously, avoid_print


import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLanguageService {
  final _storage = const FlutterSecureStorage();

  Future<String?> getAppLanguage() async {
    final lengage = await _storage.read(key: "language");
    print("service--getAppLanguage--lengage: $lengage");
    return lengage;
  }

  Future<bool> setAndChangeAppLanguage(
      String language, BuildContext context) async {
    print("service--setAndChangeAppLanguage");

    await changeAppLanguage(language, context);
    await _storage.write(key: "language", value: language);
    return true;
  }

  Future<bool?> changeAppLanguage(String language, BuildContext context) async {
    try {
    print("service--changeAppLanguage--language: $language");
      await FlutterI18n.refresh(context, Locale(language));
      return true;
      
    } catch (e,s) {
      print("service--changeAppLanguage--error: $e :::::: $s");
    }
      // Puedes manejar esto de alguna manera, por ejemplo, lanzar un error o imprimir un mensaje.
    }
  

  Future<void> getInitLanguage(BuildContext context) async {
    print("service--getInitLanguage");
    final lengage = await _storage.read(key: "language");
    if (lengage != null) {
      await FlutterI18n.refresh(context, Locale(lengage));
    } else {
      print("Warning: language is null, unable to refresh language.");
      await FlutterI18n.refresh(context, const Locale('en'));
    }
  }
}
