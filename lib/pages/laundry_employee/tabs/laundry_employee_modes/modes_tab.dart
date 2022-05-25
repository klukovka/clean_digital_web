import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../bloc/laundry_employee/tabs/laundry_employee_modes/mode_tab/mode_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../utils/clean_digital_dialogs.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../views/buttons/primary_button.dart';
import '../../../../views/entity_tiles/entity_label.dart';
import '../../../../views/error_view.dart';
import '../../../../views/loading_indicator.dart';
import '../../../../views/title_with_button.dart';

class ModesTab extends StatefulWidget implements AutoRouteWrapper {
  const ModesTab({Key? key}) : super(key: key);

  @override
  State<ModesTab> createState() => _ModesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ModesTabCubit>()..getModes(),
      child: this,
    );
  }
}

class _ModesTabState extends State<ModesTab> {
  ModesTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    ModesTabState state,
  ) {
    if (state.status == ModesTabStatus.error) {
      CleanDigitalToasts.of(context).showError(
        message: state.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<ModesTabCubit, ModesTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          switch (state.status) {
            case ModesTabStatus.error:
              return ErrorView(onPressed: cubit.getModes);
            case ModesTabStatus.loading:
              return const Center(child: LoadingIndicator());
            case ModesTabStatus.success:
              return _buildSuccessBody(state);
          }
        },
      ),
    );
  }

  Widget _buildSuccessBody(ModesTabState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TitleWithButton(
          title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
              '${state.modes.length}',
          onPressed: () =>
              CleanDigitalDialogs.of(context).showRegisterModeDialog(
            cubit.createMode,
            false,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return _buildAdditionalMde(state, index);
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: state.modes.length,
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalMde(ModesTabState state, int index) {
    return ListTile(
      title: EntityLabel(
        title: CleanDigitalLocalizations.of(context).name,
        value: state.modes[index].name,
      ),
      isThreeLine: true,
      subtitle: _buildSubtitle(state, index),
      leading: const Icon(Icons.adf_scanner),
      trailing: _buildTrailing(state, index),
    );
  }

  Widget _buildSubtitle(ModesTabState state, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EntityLabel(
          title: CleanDigitalLocalizations.of(context).costs,
          value: state.modes[index].costs,
        ),
        EntityLabel(
          title: CleanDigitalLocalizations.of(context).time,
          value: state.modes[index].time,
        ),
      ],
    );
  }

  Widget _buildTrailing(ModesTabState state, int index) {
    return SizedBox(
      width: 10.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PrimaryButton(
            title: CleanDigitalLocalizations.of(context).edit,
            onPressed: () {
              CleanDigitalDialogs.of(context).showEditModeDialog(
                state.modes[index],
                (request) {
                  cubit.updateMode(
                    state.modes[index].modeId,
                    request,
                  );
                },
              );
            },
            fullWidth: false,
          ),
          const SizedBox(width: 16),
          PrimaryButton(
            title: CleanDigitalLocalizations.of(context).delete,
            onPressed: () =>
                CleanDigitalDialogs.of(context).showConfirmNoDialog(
              title:
                  CleanDigitalLocalizations.of(context).doYouWantToDeleteMode,
              onPressed: () => cubit.deleteMode(
                state.modes[index].modeId,
              ),
            ),
            isOutlined: true,
            fullWidth: false,
          ),
        ],
      ),
    );
  }
}
