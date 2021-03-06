import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app/ui/page/tab/tab_navigator.dart';
import 'package:flutter_app/ui/widget/page_route_anim.dart';

import 'package:flutter_app/ui/page/detail_info.dart';

class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String setting = 'setting';
  static const String detail_info = 'detail_info';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('RouteSettings===' + settings.toString());
    switch (settings.name) {
      case RouteName.tab:
        return NoAnimRouteBuilder(TabNavigator());
      case RouteName.detail_info:
        var args = settings.arguments;
        return CupertinoPageRoute(builder: (_) => DetailInfo());
    }
    return null;
  }
}
