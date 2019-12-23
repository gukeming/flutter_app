import 'package:provider/provider.dart';
import 'package:flutter_app/provider/theme_provider.dart';
import 'package:flutter_app/provider/locale_provider.dart';

class GlobalProviders {

  static List<SingleChildCloneableWidget> getProviders() {
    /// 独立的model
    final List<SingleChildCloneableWidget> independentServices = [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      ),

      ChangeNotifierProvider<LocaleProvider>(
        create: (context) => LocaleProvider(),
      )
    ];

    /// 需要依赖的model
    ///
    /// UserModel依赖globalFavouriteStateModel
    final List<SingleChildCloneableWidget> dependentServices = [
//  ChangeNotifierProxyProvider<GlobalFavouriteStateModel, UserModel>(
//    create: null,
//    update: (context, globalFavouriteStateModel, userModel) =>
//    userModel ??
//        UserModel(globalFavouriteStateModel: globalFavouriteStateModel),
//  )
    ];

    final List<SingleChildCloneableWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
    ];

    final List<SingleChildCloneableWidget> providers = [
    ...independentServices,
    ...dependentServices,
    ...uiConsumableProviders
    ];

    return providers;
  }
}
