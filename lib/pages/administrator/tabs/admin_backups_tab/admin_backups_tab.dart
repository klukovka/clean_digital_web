import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../../../bloc/administrator/admin_backups_tab/admin_backups_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../utils/extensions/string_ext.dart';
import '../../../../views/buttons/primary_button.dart';
import '../../../../views/error_view.dart';
import '../../../../views/loading_indicator.dart';
import '../../../../views/title_with_button.dart';

class AdminBackupsTab extends StatefulWidget with AutoRouteWrapper {
  const AdminBackupsTab({Key? key}) : super(key: key);

  @override
  State<AdminBackupsTab> createState() => _AdminBackupsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminBackupsTabCubit>()..init(),
      child: this,
    );
  }
}

class _AdminBackupsTabState extends State<AdminBackupsTab> {
  AdminBackupsTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    AdminBackupsTabState state,
  ) {
    switch (state.status) {
      case AdminBackupsTabStatus.error:
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case AdminBackupsTabStatus.restored:
        CleanDigitalToasts.of(context).showSuccess(
          message: CleanDigitalLocalizations.of(context).backupRestored,
        );
        break;
      case AdminBackupsTabStatus.created:
        CleanDigitalToasts.of(context).showSuccess(
          message: CleanDigitalLocalizations.of(context).backupCreated,
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<AdminBackupsTabCubit, AdminBackupsTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          switch (state.status) {
            case AdminBackupsTabStatus.error:
              return ErrorView(onPressed: cubit.init);
            case AdminBackupsTabStatus.loading:
              return const LoadingIndicator();
            case AdminBackupsTabStatus.created:
            case AdminBackupsTabStatus.loadingButton:
            case AdminBackupsTabStatus.restored:
            case AdminBackupsTabStatus.success:
              return _buildSuccessBody(state);
          }
        },
      ),
    );
  }

  Widget _buildSuccessBody(AdminBackupsTabState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TitleWithButton(
          title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
              '${state.backups.length}',
          onPressed: cubit.backup,
          isLoading: state.status == AdminBackupsTabStatus.loadingButton,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(state.backups[index].backupDate().toString()),
                leading: const Icon(FontAwesome5.database),
                trailing: PrimaryButton(
                  title: CleanDigitalLocalizations.of(context).restore,
                  onPressed: () => cubit.restore(state.backups[index]),
                  fullWidth: false,
                ),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: state.backups.length,
          ),
        ),
      ],
    );
  }
}
