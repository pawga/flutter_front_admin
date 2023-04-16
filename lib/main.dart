import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/lang/translations.dart';
import 'routes/app_pages.dart';
import 'theme/theme_data.dart';

Future<void> main() async {

  var initial = Routes.home;

  runApp(GetMaterialApp(
    navigatorKey: Get.key,
    locale: TranslationService.locale,
    fallbackLocale: TranslationService.fallbackLocale,
    translations: TranslationService(),
    defaultTransition: Transition.noTransition, //Transition.cupertino,
    debugShowCheckedModeBanner: false,
    initialRoute: initial,
    getPages: AppPages.routes,
    theme: lightThemeData(),
    darkTheme: darkThemeData(),
  ));
}