import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app/ui/page/tab/tab_navigator.dart';
import 'package:flutter_app/ui/widget/page_route_anim.dart';

class RouteName {
  static const String splash = 'splash';
  static const String tab = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String setting = 'setting';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('RouteSettings===' + settings.toString());
    switch (settings.name) {
      case RouteName.tab:
        return NoAnimRouteBuilder(TabNavigator());
    }
    return null;
  }
}
