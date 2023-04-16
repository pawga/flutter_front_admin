import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_en.dart';
import 'ru_ru.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ru_RU': ruRU,
      };
}
