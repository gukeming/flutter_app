import 'package:flutter/material.dart';
import 'package:flutter_app/generated/i18n.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider() {
    _localeIndex = 0;
  }
  //  static const localeNameList = ['auto', '中文', 'English'];
  static const localeValueList = ['', 'zh-CN', 'en'];

  //本地记录的缓存key
  static const kLocaleIndex = 'kLocaleIndex';

  int _localeIndex;

  int get localeIndex => _localeIndex;

  Locale get locale {
    if (_localeIndex > 0) {
      final value = localeValueList[_localeIndex].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
    }
    // 跟随系统
    return null;
  }

  void switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
//    StorageManager.sharedPreferences.setInt(kLocaleIndex, index);
  }

  static String localeName(int index, BuildContext context) {
    switch (index) {
      case 0:
        return S.of(context).autoBySystem;
      case 1:
        return '中文';
      case 2:
        return 'English';
      default:
        return '';
    }
  }
}
