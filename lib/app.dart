import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import './homep.dart';
import './generated/locale_keys.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: LocaleKeys.webName.tr(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}