import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/utils/language/en_us.dart';
import 'package:iloveyoucleanwater/utils/language/vi_VN.dart';

class LocalizationService extends Translations {
  final controller = Get.put(HomeController());
  // static bool islangs = true;
  static bool islangs = GetStorage().hasData("language")
      ? GetStorage().read("language") == locales[0].languageCode
          ? true
          : false
      : true;

  // here we need to add our default language
  static final locale = GetStorage().hasData("language")
      ? Locale(GetStorage().read("language"))
      : Locale('vi', 'VN');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('tr', 'TR');

  static final langs = [
    true,
    false,
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
  void changeLocale(bool lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (GetStorage().hasData("language")) {
      GetStorage().remove("language");
    }
    GetStorage().write("language", locale.languageCode);
    Get.updateLocale(locale);
    // controller.loadlanguage(lang);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(bool lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
