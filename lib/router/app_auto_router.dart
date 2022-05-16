import 'package:auto_route/auto_route.dart';

import '../pages/auth/login_page.dart';
import '../pages/auth/restore_password_page.dart';
import '../pages/splash_page/splash_page.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Tab,Route',
  routes: [
    CustomRoute(
      page: SplashPage,
      path: '/init',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: LoginPage,
      path: '/auth/login',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: RestorePasswordPage,
      path: '/auth/restore',
      initial: true,
      fullscreenDialog: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
  ],
)
class $AppAutoRouter {}
