import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../bloc/app_control/app_control_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../utils/clean_digital_dialogs.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../utils/extensions/locale_ext.dart';
import '../../../../utils/extensions/theme_mode_ext.dart';
import '../../../../views/buttons/primary_button.dart';
import '../../../../views/loading_indicator.dart';
import '../../../../views/title_with_button.dart';
import '../../../bloc/laundry_employee/tabs/laundry_settings_tab/laundry_settings_tab_cubit.dart';

enum _LaundrySettingsTabField { language, theme }

class LaundrySettingsTab extends StatefulWidget implements AutoRouteWrapper {
  const LaundrySettingsTab({Key? key}) : super(key: key);

  @override
  State<LaundrySettingsTab> createState() => _LaundrySettingsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LaundrySettingsTabCubit>()..init(),
      child: this,
    );
  }
}

class _LaundrySettingsTabState extends State<LaundrySettingsTab> {
  AppControlCubit get appControlCubit => context.read();
  LaundrySettingsTabCubit get cubit => context.read();

  final _fbKey = GlobalKey<FormBuilderState>();

  void _onStateChanged(
    BuildContext context,
    LaundrySettingsTabState state,
  ) {
    switch (state.status) {
      case LaundrySettingsTabStatus.error:
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case LaundrySettingsTabStatus.deleted:
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
      child: BlocConsumer<LaundrySettingsTabCubit, LaundrySettingsTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          if (state.status == LaundrySettingsTabStatus.loading) {
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

  Widget _buildContent(LaundrySettingsTabState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildLaundryTitle(state),
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

  Widget _buildInfo(LaundrySettingsTabState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(
          CleanDigitalLocalizations.of(context).name,
          state.laundry.name,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          CleanDigitalLocalizations.of(context).phone,
          state.laundry.phone,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          CleanDigitalLocalizations.of(context).address,
          state.laundry.address,
        ),
        const SizedBox(height: 16),
        _buildLabel(
          CleanDigitalLocalizations.of(context).maxWashMachines,
          '${state.laundry.maxAmount}',
        ),
        const SizedBox(height: 16),
        _buildLabel(
          CleanDigitalLocalizations.of(context).email,
          state.laundry.user.email,
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
      name: _LaundrySettingsTabField.theme.name,
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
      name: _LaundrySettingsTabField.language.name,
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

  Widget _buildLaundryTitle(LaundrySettingsTabState state) {
    final localizations = CleanDigitalLocalizations.of(context);

    return TitleWithButton(
      title: localizations.aboutLaundry,
      titleWidget: Text(localizations.edit),
      onPressed: () => CleanDigitalDialogs.of(context).showEditLaundryDialog(
        state.laundry,
        cubit.updateLaundry,
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
