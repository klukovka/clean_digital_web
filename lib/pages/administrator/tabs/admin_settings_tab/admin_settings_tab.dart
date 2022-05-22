import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

import '../../../../bloc/administrator/tabs/admin_settings_tab/admin_settings_tab_cubit.dart';
import '../../../../bloc/app_control/app_control_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../models/laundry.dart';
import '../../../../models/statistic/all_laundry_statistic.dart';
import '../../../../models/statistic/payment.dart';
import '../../../../models/statistic/payment_wash_machine_entry.dart';
import '../../../../models/statistic/rating_wash_machine_entry.dart';
import '../../../../models/statistic/repair.dart';
import '../../../../models/statistic/repair_wash_machine_entry.dart';
import '../../../../models/statistic/time_and_usage.dart';
import '../../../../models/statistic/time_and_usage_washing_machine_entry.dart';
import '../../../../models/wash_machine.dart';
import '../../../../utils/clean_digital_dialogs.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../utils/extensions/locale_ext.dart';
import '../../../../utils/extensions/theme_mode_ext.dart';
import '../../../../views/buttons/primary_button.dart';
import '../../../../views/loading_indicator.dart';
import '../../../../views/title_with_button.dart';
import '../admin_statistic_tab/view/statistic_view.dart';

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
    return _buildTemp();
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<AdminSettingsTabCubit, AdminSettingsTabState>(
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
      ),
    );
  }

  Widget _buildTemp() {
    const wm1 = WashMachine(
      washMachineId: '1',
      laundryId: 'laundryId',
      model: 'model',
      manufacturer: 'manufacturer',
      capacity: 4,
      powerUsage: 45,
      spinningSpeed: 44,
      maxTime: 100,
      currentTime: 34,
      isWorking: true,
      isWashing: false,
    );
    const wm2 = WashMachine(
      washMachineId: '2',
      laundryId: 'laundryId',
      model: 'model',
      manufacturer: 'manufacturer',
      capacity: 4,
      powerUsage: 45,
      spinningSpeed: 44,
      maxTime: 100,
      currentTime: 34,
      isWorking: true,
      isWashing: false,
    );
    return StatisticView(
      onPressed: () {},
      laundryStatistic: const AllLaundryStatistic(
        laundry: Laundry.empty(),
        laundryPaymentValue: Payment(
          all: 300,
          paidBonuses: 40,
          paidMoney: 260,
        ),
        laundryRatingValue: 4.5,
        laundryRepairValue: Repair(amount: 3, money: 45),
        laundryTimeAndUsageValue: TimeAndUsage(
          powerUsage: 500,
          time: 50,
        ),
        washMachinePaymentValue: [
          PaymentWashMachineEntry(
              Payment(all: 220, paidBonuses: 20, paidMoney: 200), wm1),
          PaymentWashMachineEntry(
              Payment(all: 80, paidBonuses: 40, paidMoney: 40), wm2),
        ],
        washMachineRatingValue: [
          RatingWashMachineEntry(4, wm1),
          RatingWashMachineEntry(3.5, wm2),
        ],
        washMachineRepairValue: [
          RepairWashMachineEntry(Repair(amount: 2, money: 20), wm1),
          RepairWashMachineEntry(Repair(amount: 1, money: 25), wm1),
        ],
        washMachineTimeAndUsageValue: [
          TimeAndUsageWashMachineEntry(
              TimeAndUsage(time: 20, powerUsage: 200), wm1),
          TimeAndUsageWashMachineEntry(
              TimeAndUsage(time: 30, powerUsage: 300), wm1),
        ],
      ),
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

    return TitleWithButton(
      title: localizations.aboutAdmin,
      onPressed: () => CleanDigitalDialogs.of(context).showRegisterAdminDialog(
        cubit.registerAdmin,
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
