import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './homep.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inconnection app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'inconnection'),
    );
  }
}