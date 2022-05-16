import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/splash_page/splash_page_cubit.dart';
import '../../di/injection_container.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/role.dart';
import '../../router/clean_digital_router.dart';
import '../../views/loading_indicator.dart';

class SplashPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<SplashPageCubit>(),
      child: this,
    );
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final Timer _exitTimer;

  SplashPageCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _exitTimer = Timer(
      const Duration(seconds: 1),
      cubit.tryLogIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _exitTimer.cancel();
  }

  void _onStateChanged(
    BuildContext context,
    SplashPageState state,
  ) {
    switch (state.status) {
      case SplashPageStatus.unauthorized:
      case SplashPageStatus.error:
        router.resetToLoginPage();
        break;

      case SplashPageStatus.authorized:
        navigateAuthorized(state.role);
        break;
      default:
        break;
    }
  }

  void navigateAuthorized(Role? role) {
    switch (role) {
      case Role.admin:
        router.resetToAdminMainPage();
        break;
      case Role.laundry:
        router.resetToLaundryMainPage();
        break;
      case Role.repairCompany:
        router.resetToRepairCompanyMainPage();
        break;
      case Role.employee:
        router.resetToEmployeeMainPage();
        break;
      default:
        router.resetToLoginPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashPageCubit, SplashPageState>(
        listener: _onStateChanged,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(context),
              const SizedBox(height: 16),
              const LoadingIndicator(size: 48),
            ],
          ),
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
