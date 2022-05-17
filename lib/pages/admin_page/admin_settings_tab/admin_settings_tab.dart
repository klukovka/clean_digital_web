import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../bloc/app_control/app_control_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../utils/extensions/locale_ext.dart';
import '../../../utils/extensions/theme_mode_ext.dart';
import '../../../views/buttons/primary_button.dart';

enum _AdminSettingsTabField { language, theme }

class AdminSettingsTab extends StatefulWidget {
  const AdminSettingsTab({Key? key}) : super(key: key);

  @override
  State<AdminSettingsTab> createState() => _AdminSettingsTabState();
}

class _AdminSettingsTabState extends State<AdminSettingsTab> {
  AppControlCubit get appControlCubit => context.read();

  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValue => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildAdminTitle(),
        const SizedBox(height: 16),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       flex: 5,
        //       child: _buildUserInfo(state),
        //     ),
        //     const SizedBox(width: 4),
        //     Expanded(
        //       child: _buildButtons(state),
        //     )
        //   ],
        // ),
        const SizedBox(height: 16),
        _buildForm(),
        const SizedBox(height: 16),
        PrimaryButton(
          title: CleanDigitalLocalizations.of(context).logout,
          onPressed: appControlCubit.logout,
        ),
        const SizedBox(height: 16),
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
