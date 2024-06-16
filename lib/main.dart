import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

import './app.dart';
import './generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      assetLoader: CodegenLoader(), 
      supportedLocales: [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: Locale('ru'),
      child: MyApp()
    ),
  );              
}