import 'dart:convert';

import '../models/language_model.dart';

class LanguageService {


   static const jsonString = '''
    [
        {"iso": "es","name": "Español","name_native": "Español","flag": "🇪🇸"},
        {"iso": "en","name": "Inglés","name_native": "English","flag": "🇬🇧"},
        {"iso": "fr","name": "Francés","name_native": "Français","flag": "🇫🇷"},
        {"iso": "it","name": "Italiano","name_native": "Italiano","flag": "🇮🇹"}
    ]
    ''';


  List<LanguageModel> getLanguagesFromJsonString() {
    List<dynamic> jsonList = json.decode(jsonString);

    List<LanguageModel> languages = jsonList
        .map((data) => LanguageModel.fromJson(data))
        .toList();

    return languages;
  }
}