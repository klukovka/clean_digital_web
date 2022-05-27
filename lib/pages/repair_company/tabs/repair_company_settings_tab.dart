import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../bloc/app_control/app_control_cubit.dart';
import '../../../bloc/repair_company/repair_company_settings_tab/repair_company_settings_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../utils/clean_digital_dialogs.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../utils/extensions/locale_ext.dart';
import '../../../utils/extensions/theme_mode_ext.dart';
import '../../../views/buttons/primary_button.dart';
import '../../../views/loading_indicator.dart';
import '../../../views/title_with_button.dart';

enum _RepairCompanySettingsTabField { language, theme }

class RepairCompanySettingsTab extends StatefulWidget
    implements AutoRouteWrapper {
  const RepairCompanySettingsTab({Key? key}) : super(key: key);

  @override
  State<RepairCompanySettingsTab> createState() =>
      _RepairCompanySettingsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<RepairCompanySettingsTabCubit>()..init(),
      child: this,
    );
  }
}

class _RepairCompanySettingsTabState extends State<RepairCompanySettingsTab> {
  AppControlCubit get appControlCubit => context.read();
  RepairCompanySettingsTabCubit get cubit => context.read();

  final _fbKey = GlobalKey<FormBuilderState>();

  void _onStateChanged(
    BuildContext context,
    RepairCompanySettingsTabState state,
  ) {
    switch (state.status) {
      case RepairCompanySettingsTabStatus.error:
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case RepairCompanySettingsTabStatus.deleted:
        appControlCubit.logout();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<RepairCompanySettingsTabCubit,
          RepairCompanySettingsTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          if (state.status == RepairCompanySettingsTabStatus.loading) {
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
      ),
    );
  }

  Widget _buildContent(RepairCompanySettingsTabState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildRepairCompanyTitle(state),
        const SizedBox(height: 16),
        Row(
          children: [
            Flexible(child: _buildInfo(state)),
            const Spacer(),
            PrimaryButton(
              title: CleanDigitalLocalizations.of(context).updatePassword,
              fullWidth: false,
              isOutlined: true,
              onPressed: () => CleanDigitalDialogs.of(context)
                  .showUpdatePasswordDialog(cubit.updatePassword),
            ),
          ],
        ),
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

  Widget _buildInfo(RepairCompanySettingsTabState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(
          CleanDigitalLocalizations.of(context).name,
          state.repairCompany.name,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          CleanDigitalLocalizations.of(context).phone,
          state.repairCompany.phone,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          CleanDigitalLocalizations.of(context).address,
          state.repairCompany.address,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          CleanDigitalLocalizations.of(context).email,
          state.repairCompany.user.email,
        ),
      ],
    );
  }

  Widget _buildLabel(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headline5,
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
      name: _RepairCompanySettingsTabField.theme.name,
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
      name: _RepairCompanySettingsTabField.language.name,
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

  Widget _buildRepairCompanyTitle(RepairCompanySettingsTabState state) {
    final localizations = CleanDigitalLocalizations.of(context);

    return TitleWithButton(
      title: localizations.aboutRepairCompany,
      titleWidget: Text(localizations.edit),
      onPressed: () =>
          CleanDigitalDialogs.of(context).showEditRepairCompanyDialog(
        state.repairCompany,
        cubit.updateRepairCompany,
      ),
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
