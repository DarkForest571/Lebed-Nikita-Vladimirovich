import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app.dart';
import './generated/codegen_loader.g.dart';


class CounterObserver extends BlocObserver {
  /// {@macro counter_observer}
  const CounterObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
  }
}

class CounterApp extends EasyLocalization {
  CounterApp({
    super.key,
    super.assetLoader, 
    required super.supportedLocales,
    required super.path,
    super.fallbackLocale,
    required super.child
    });
}

void main() async {
  Bloc.observer = const CounterObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(CounterApp(
      assetLoader: CodegenLoader(), 
      supportedLocales: [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: Locale('ru'),
      child: MyApp()
    ),
  );              
}