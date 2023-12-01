import 'dart:convert';

import '../models/language_model.dart';

class LanguageService {
  static const jsonEs = '''
    [
        {"iso": "es","name": "Español","name_native": "Español","flag": "🇪🇸"},
        {"iso": "en","name": "Inglés","name_native": "English","flag": "🇬🇧"},
        {"iso": "fr","name": "Francés","name_native": "Français","flag": "🇫🇷"},
        {"iso": "it","name": "Italiano","name_native": "Italiano","flag": "🇮🇹"}
    ]
    ''';
  static const jsonEn = '''
 [
  {"iso": "es", "name": "Spanish", "name_native": "Español", "flag": "🇪🇸"},
  {"iso": "en", "name": "English", "name_native": "English", "flag": "🇬🇧"},
  {"iso": "fr", "name": "French", "name_native": "Français", "flag": "🇫🇷"},
  {"iso": "it", "name": "Italian", "name_native": "Italiano", "flag": "🇮🇹"}
]

    ''';
  static const jsonFr = '''
   [
  {"iso": "es", "name": "Espagnol", "name_native": "Español", "flag": "🇪🇸"},
  {"iso": "en", "name": "Anglais", "name_native": "English", "flag": "🇬🇧"},
  {"iso": "fr", "name": "Français", "name_native": "Français", "flag": "🇫🇷"},
  {"iso": "it", "name": "Italien", "name_native": "Italiano", "flag": "🇮🇹"}
]
    ''';
  static const jsonIt = '''
   [
  {"iso": "es", "name": "Spagnolo", "name_native": "Español", "flag": "🇪🇸"},
  {"iso": "en", "name": "Inglese", "name_native": "English", "flag": "🇬🇧"},
  {"iso": "fr", "name": "Francese", "name_native": "Français", "flag": "🇫🇷"},
  {"iso": "it", "name": "Italiano", "name_native": "Italiano", "flag": "🇮🇹"}
]
    ''';

  List<LanguageModel> getLanguagesFromJsonString(String locale) {
    List<dynamic> jsonList = json.decode(
        //dependiendo del idioma seleccionado, se carga el json correspondiente
        locale == 'es'
            ? jsonEs
            : locale == 'en'
                ? jsonEn
                : locale == 'fr'
                    ? jsonFr
                    : jsonIt);

    List<LanguageModel> languages =
        jsonList.map((data) => LanguageModel.fromJson(data)).toList();

    return languages;
  }
}
