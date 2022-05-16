// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../pages/splash_page/splash_page.dart' as _i1;

class AppAutoRouter extends _i2.RootStackRouter {
  AppAutoRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i2.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.SplashPage(key: args.key),
          transitionsBuilder: _i2.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/', redirectTo: '/init', fullMatch: true),
        _i2.RouteConfig(SplashRoute.name, path: '/init')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i2.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({_i3.Key? key})
      : super(SplashRoute.name, path: '/init', args: SplashRouteArgs(key: key));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}
