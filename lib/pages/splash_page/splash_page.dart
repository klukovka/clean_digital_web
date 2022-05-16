import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../router/clean_digital_router.dart';
import '../../views/loading_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Timer _exitTimer;

  @override
  void initState() {
    super.initState();
    _exitTimer = Timer(
      const Duration(seconds: 1),
      router.resetToLoginPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _exitTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(context),
            const SizedBox(height: 16),
            const LoadingIndicator(size: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.local_laundry_service,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          size: 48,
        ),
        const SizedBox(width: 8),
        Text(
          CleanDigitalLocalizations.of(context).appName,
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
