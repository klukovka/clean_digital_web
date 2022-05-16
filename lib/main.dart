import 'package:clean_digital_web/clean_digital_app.dart';
import 'package:clean_digital_web/di/injection_container.dart';
import 'package:clean_digital_web/services/preferences_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final prefs = locator<PreferencesService>();

  runApp(CleanDigitalApp.create(
    prefs.getLocale(),
    prefs.getAppTheme(),
  ));
}
