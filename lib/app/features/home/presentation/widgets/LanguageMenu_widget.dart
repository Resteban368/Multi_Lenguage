
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/language_model.dart';
import '../bloc/lenguage_bloc.dart';

class LanguageMenu extends StatelessWidget {
  final List<LanguageModel> languages;

  const LanguageMenu({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.language),
      onSelected: (value) {
        BlocProvider.of<LenguageBloc>(context)
            .add(ChangeLanguageEvent(value, context));
      },
      itemBuilder: (BuildContext context) {
        return languages.map((language) {
          return PopupMenuItem(
            value: language.iso,
            child: Row(
              children: [
                Text(language.flag.toString()),
                const SizedBox(width: 10),
                Text(language.name!),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}


