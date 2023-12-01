import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:multi_lenguages/app/common/l10n/delegate.dart';
import 'package:multi_lenguages/app/common/l10n/locales.dart';
import 'package:multi_lenguages/app/features/home/presentation/bloc/lenguage_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/config.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    translatorDelegate: translatorDelegate,
    locales: locales,
    navigatorKey: navigatorKey,
  ));
}

class MyApp extends StatefulWidget {
  final FlutterI18nDelegate translatorDelegate;
  final List<Locale> locales;
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp(
      {super.key,
      required this.translatorDelegate,
      required this.locales,
      required this.navigatorKey});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<LenguageBloc>(
          create: (context) => LenguageBloc(
            // context,
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter App Multi Lenguages',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('fr', 'FR'),
          Locale('es', 'ES'),
          Locale('it', 'IT'),
        ],
        localizationsDelegates: [
          widget.translatorDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
