import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_app/generated/i18n.dart';

class LocaleProvider extends ChangeNotifier {
  // static const localeNameList = ['auto', '中文', 'English'];
  static const localeValueList = ['', 'zh-CN', 'en'];

  //本地记录的缓存语言的key
  static const localeIndexKey = 'localeIndexKey';

  int _localeIndex;

  int get localeIndex => _localeIndex;

  LocaleProvider() {
    _localeIndex = SpUtil.getInt(localeIndexKey) ?? 0;
  }

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
    SpUtil.putInt(localeIndexKey, index);
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
