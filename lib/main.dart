import 'package:flutter_app_ncovi/generated/i18n.dart';
import 'package:flutter_app_ncovi/views/singin/LoginScreen.dart';
import 'package:flutter_app_ncovi/views/splat/SplatScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home/home_view.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        // Setup multilanguage
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        navigatorKey: locator<NavigatorService>().navigatorKey,
        home: SplatScreen(),
        // Create list router
        routes: {
          SplatScreen.routeName: (_) => SplatScreen(),
          LoginScreen.routeName: (_) => LoginScreen()
        },
      ),
    );
  }

}
