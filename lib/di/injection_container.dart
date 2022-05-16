import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() {
  locator.registerSingleton<RouteObserver<Route>>(RouteObserver<Route>());
  return $configureDependencies(locator);
}
