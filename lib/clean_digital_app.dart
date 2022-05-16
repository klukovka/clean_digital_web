import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: FlexThemeData.light(
        scheme: FlexScheme.jungle,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.jungle,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.outfit().fontFamily,
      ),
      themeMode: ThemeMode.system,
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
