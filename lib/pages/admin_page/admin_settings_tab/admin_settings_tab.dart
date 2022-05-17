import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../bloc/admin_page/admin_settings_tab/admin_settings_tab_cubit.dart';
import '../../../bloc/app_control/app_control_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../utils/clean_digital_dialogs.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../utils/extensions/locale_ext.dart';
import '../../../utils/extensions/theme_mode_ext.dart';
import '../../../views/buttons/primary_button.dart';
import '../../../views/loading_indicator.dart';

enum _AdminSettingsTabField { language, theme }

class AdminSettingsTab extends StatefulWidget implements AutoRouteWrapper {
  const AdminSettingsTab({Key? key}) : super(key: key);

  @override
  State<AdminSettingsTab> createState() => _AdminSettingsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminSettingsTabCubit>()..init(),
      child: this,
    );
  }
}

class _AdminSettingsTabState extends State<AdminSettingsTab> {
  AppControlCubit get appControlCubit => context.read();
  AdminSettingsTabCubit get cubit => context.read();

  final _fbKey = GlobalKey<FormBuilderState>();

  void _onStateChanged(
    BuildContext context,
    AdminSettingsTabState state,
  ) {
    switch (state.status) {
      case AdminSettingsTabStatus.error:
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case AdminSettingsTabStatus.deleted:
        appControlCubit.logout();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminSettingsTabCubit, AdminSettingsTabState>(
      listener: _onStateChanged,
      builder: (context, state) {
        if (state.status == AdminSettingsTabStatus.loading) {
          return const Center(child: LoadingIndicator());
        }
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: _buildContent(state),
            )
          ],
        );
      },
    );
  }

  Widget _buildContent(AdminSettingsTabState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildAdminTitle(),
        const SizedBox(height: 16),
        _adminInfo(state),
        const SizedBox(height: 16),
        _buildForm(),
        const SizedBox(height: 16),
        const Spacer(),
        PrimaryButton(
          title: CleanDigitalLocalizations.of(context).logout,
          onPressed: appControlCubit.logout,
        ),
        const SizedBox(height: 16),
        PrimaryButton(
          title: CleanDigitalLocalizations.of(context).deleteAccount,
          isOutlined: true,
          onPressed: () => CleanDigitalDialogs.of(context).showConfirmNoDialog(
            title:
                CleanDigitalLocalizations.of(context).doYouWantToDeleteAccount,
            onPressed: cubit.delete,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _adminInfo(AdminSettingsTabState state) {
    return Row(
      children: [
        Text(
          CleanDigitalLocalizations.of(context).email,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: 8),
        Text(
          state.user.email,
          style: Theme.of(context).textTheme.headline5,
        ),
        const Spacer(),
        PrimaryButton(
          title: CleanDigitalLocalizations.of(context).updatePassword,
          fullWidth: false,
          isOutlined: true,
          onPressed: () => CleanDigitalDialogs.of(context)
              .showUpdatePasswordDialog(cubit.updatePassword),
        ),
      ],
    );
  }

  Widget _buildForm() {
    final localizations = CleanDigitalLocalizations.of(context);

    return FormBuilder(
      key: _fbKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(localizations.launguage),
          const SizedBox(height: 16),
          _buildLanguageChips(),
          const SizedBox(height: 16),
          _buildTitle(localizations.theme),
          const SizedBox(height: 16),
          _buildThemeChips(),
        ],
      ),
    );
  }

  Widget _buildThemeChips() {
    return FormBuilderChoiceChip<ThemeMode>(
      initialValue: appControlCubit.state.theme,
      spacing: 16,
      padding: const EdgeInsets.all(16),
      name: _AdminSettingsTabField.theme.name,
      onChanged: (mode) {
        if (mode != null) {
          appControlCubit.setAppTheme(mode);
        }
      },
      options: ThemeMode.values.map((item) {
        return FormBuilderFieldOption(
          value: item,
          child: Text(
            item.getLabel(context),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLanguageChips() {
    return FormBuilderChoiceChip<Locale>(
      initialValue: appControlCubit.state.locale,
      spacing: 16,
      padding: const EdgeInsets.all(16),
      name: _AdminSettingsTabField.language.name,
      onChanged: (locale) {
        if (locale != null) {
          appControlCubit.setLocale(locale);
        }
      },
      options: CleanDigitalLocalizations.supportedLocales.map((item) {
        return FormBuilderFieldOption(
          value: item,
          child: Text(item.getLabel(context)),
        );
      }).toList(),
    );
  }

  Widget _buildAdminTitle() {
    final localizations = CleanDigitalLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle(localizations.aboutAdmin),
        PrimaryButton.custom(
          fullWidth: false,
          // onPressed: HippodromeDialogs.of(context).showCreateAdminDialog,
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add),
              const SizedBox(width: 8),
              Text(localizations.addNew),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );
  }
}
