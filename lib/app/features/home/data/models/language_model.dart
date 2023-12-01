// ignore_for_file: unnecessary_new, prefer_collection_literals

class LanguageModel {
  String? iso;
  String? name;
  String? nameNative;
  String? flag;

  LanguageModel({this.iso, this.name, this.nameNative, this.flag});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    iso = json['iso'] ?? "";
    name = json['name'] ?? "";
    nameNative = json['name_native'] ?? "";
    flag = json['flag'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso'] = iso ?? "";
    data['name'] = name ?? "";
    data['name_native'] = nameNative ?? "";
    data['flag'] = flag ?? "";
    return data;
  }
}

final jsonLanguages = [
  {"iso": "es", "name": "Español", "name_native": "Español", "flag": "🇪🇸"},
  {"iso": "en", "name": "Inglés", "name_native": "English", "flag": "🇬🇧"},
  {"iso": "fr", "name": "Francés", "name_native": "Français", "flag": "🇫🇷"},
  {"iso": "de", "name": "Alemán", "name_native": "Deutsch", "flag": "🇩🇪"},
  {"iso": "it", "name": "Italiano", "name_native": "Italiano", "flag": "🇮🇹"}
];
