// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "webName": "Inconnection app",
  "appName": "inconnection",
  "myPage": "My page",
  "favorite": "Favorite",
  "photo": "Photo",
  "addPost": "Add post",
  "adsHere": "Ads here"
};
static const Map<String,dynamic> ru = {
  "webName": "Приложение на связи",
  "appName": "насвязи",
  "myPage": "Моя страница",
  "favorite": "Любимое",
  "photo": "Фото",
  "addPost": "Добавить пост",
  "adsHere": "Реклама здесь"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
