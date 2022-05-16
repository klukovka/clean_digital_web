import 'package:flutter/material.dart';

import 'di/injection_container.dart';
import 'l10n/clean_digital_localizations.dart';
import 'router/app_auto_router.gr.dart';
import 'router/clean_digital_observer.dart';

class CleanDigitalApp extends StatelessWidget {
  const CleanDigitalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: CleanDigitalLocalizations.localizationsDelegates,
      supportedLocales: CleanDigitalLocalizations.supportedLocales,
      routeInformationParser: locator<AppAutoRouter>().defaultRouteParser(),
      routeInformationProvider: locator<AppAutoRouter>().routeInfoProvider(),
      routerDelegate: locator<AppAutoRouter>().delegate(
        navigatorObservers: () {
          return [CleanDigitalObserver()];
        },
      ),
    );
  }
}
