import 'package:flutter/material.dart';

import 'clean_digital_app.dart';
import 'di/injection_container.dart';
import 'services/preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final prefs = locator<PreferencesService>();

  runApp(CleanDigitalApp.create(
    prefs.getLocale(),
    prefs.getAppTheme(),
  ));
}
