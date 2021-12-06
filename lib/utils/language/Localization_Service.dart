import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/utils/language/en_us.dart';
import 'package:iloveyoucleanwater/utils/language/vi_VN.dart';

class LocalizationService extends Translations {
  final controller = Get.put(HomeController());
  // here we need to add our default language
  static final locale = Locale('vi', 'VN');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('tr', 'TR');

  static final langs = [
    '🇻🇳',
    '🇬🇧',
  ];

  static final locales = [
    Locale('vi', 'VN'),
    Locale('en', 'US'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
    controller.loadlanguage(lang);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
