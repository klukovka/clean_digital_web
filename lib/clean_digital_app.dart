import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'bloc/app_control/app_control_cubit.dart';
import 'di/injection_container.dart';
import 'l10n/clean_digital_localizations.dart';
import 'router/app_auto_router.gr.dart';
import 'router/clean_digital_observer.dart';

class CleanDigitalApp extends StatefulWidget {
  static Widget create(Locale locale, ThemeMode theme) {
    return BlocProvider(
      create: (_) => locator<AppControlCubit>(
        param1: AppControlState(
          locale: locale,
          theme: theme,
        ),
      ),
      child: const CleanDigitalApp._(),
    );
  }

  const CleanDigitalApp._({Key? key}) : super(key: key);

  @override
  State<CleanDigitalApp> createState() => _CleanDigitalAppState();
}

class _CleanDigitalAppState extends State<CleanDigitalApp> {
  ThemeData get _lightTheme {
    return FlexThemeData.light(
      scheme: FlexScheme.jungle,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
        inputDecoratorRadius: 12.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: GoogleFonts.outfit().fontFamily,
    );
  }

  ThemeData get _darkTheme {
    return FlexThemeData.dark(
      scheme: FlexScheme.jungle,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
        inputDecoratorRadius: 12.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: GoogleFonts.outfit().fontFamily,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppControlCubit, AppControlState>(
        builder: (context, state) {
      return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: _lightTheme,
          darkTheme: _darkTheme,
          themeMode: state.theme,
          locale: state.locale,
          localizationsDelegates:
              CleanDigitalLocalizations.localizationsDelegates,
          supportedLocales: CleanDigitalLocalizations.supportedLocales,
          routeInformationParser: locator<AppAutoRouter>().defaultRouteParser(),
          routeInformationProvider:
              locator<AppAutoRouter>().routeInfoProvider(),
          routerDelegate: locator<AppAutoRouter>().delegate(
            navigatorObservers: () {
              return [CleanDigitalObserver()];
            },
          ),
        );
      });
    });
  }

  // Widget _buildWrapper(BuildContext context, Widget? widget) {
  //   return ResponsiveWrapper.builder(
  //     BouncingScrollWrapper.builder(context, widget!),
  //     maxWidth: 1200,
  //     minWidth: 450,
  //     defaultScale: true,
  //     breakpoints: [
  //       const ResponsiveBreakpoint.resize(480, name: MOBILE),
  //       const ResponsiveBreakpoint.autoScale(800, name: TABLET),
  //       const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
  //       const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
  //       const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
  //     ],
  //   );
  // }
}
