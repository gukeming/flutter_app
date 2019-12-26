import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';

import 'package:flutter_app/provider/global_providers.dart';
import 'package:flutter_app/provider/theme_provider.dart';
import 'package:flutter_app/provider/locale_provider.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_app/setup.dart';
import 'package:flutter_app/route/router.dart';

void main() {
  Setup.init(() {
    Provider.debugCheckInvalidValueType = null;
    runApp(App());
  });
}

/// This Widget is the main application widget.
class App extends StatelessWidget {
  static const String _title = 'app';

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: GlobalProviders.getProviders(),
        child: Consumer2<ThemeProvider, LocaleProvider>(
          builder: (context, themeProvider, localeProvider, child) {
            return MaterialApp(
              title: _title,
              //home: const MyStatefulWidget(),
              debugShowCheckedModeBanner: true,
              theme: themeProvider.themeData(),
              darkTheme: themeProvider.themeData(isDarkMode: true),
              localizationsDelegates: [
                S.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              locale: localeProvider.locale,
              supportedLocales: S.delegate.supportedLocales,
              //设置默认语言
              localeResolutionCallback: S.delegate.resolution(
                fallback: const Locale('zh', 'CN'),
              ),
              onGenerateRoute: Router.generateRoute,
              initialRoute: RouteName.tab,
            );
          },
        ),
      ),
    );
  }
}
