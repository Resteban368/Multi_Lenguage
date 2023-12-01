// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:go_router/go_router.dart';

import '../../data/services/language_service.dart';
import '../bloc/lenguage_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLanguageService().getInitLanguage(context);

    return BlocBuilder<LenguageBloc, LenguageState>(
      builder: (context, state) {
        print('HomeScreen: $state');
        Widget body;

        switch (state.runtimeType) {
          case InitialLanguageState:
            body = const Center(
              child: CircularProgressIndicator(),
            );
            break;

          case LoadedLanguageState:
            body = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FlutterI18n.translate(context, "home.message"),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 0, 83, 105),
                      minimumSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      context.go("/profile");
                    },
                    child: Text(
                      FlutterI18n.translate(context, "home.btn_next"),
                    ),
                  ),
                ],
              ),
            );
            break;

          case ErrorLanguageState:
            body = Center(
              child: Text(
                "Error: ${(state as ErrorLanguageState).errorMessage}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            );
            break;

          default:
            body = const Center(
              child: Text(
                "Unexpected State",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 83, 105),
            title: Center(
              child: Text(
                FlutterI18n.translate(context, "home.title"),
                textAlign: TextAlign.center,
                
              ),
            ),
            actions: [
              LanguageMenu(languages: state.languages),
            ],
          ),
          body: body,
        );
      },
    );
  }
}
