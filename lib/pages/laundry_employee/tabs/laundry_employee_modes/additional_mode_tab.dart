import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../bloc/laundry_employee/tabs/laundry_employee_modes/additional_modes_tab/additional_modes_tab_cubit.dart';
import '../../../../di/injection_container.dart';
import '../../../../l10n/clean_digital_localizations.dart';
import '../../../../utils/clean_digital_dialogs.dart';
import '../../../../utils/clean_digital_toasts.dart';
import '../../../../views/buttons/primary_button.dart';
import '../../../../views/entity_tiles/entity_label.dart';
import '../../../../views/error_view.dart';
import '../../../../views/loading_indicator.dart';
import '../../../../views/title_with_button.dart';

class AdditionalModesTab extends StatefulWidget implements AutoRouteWrapper {
  const AdditionalModesTab({Key? key}) : super(key: key);

  @override
  State<AdditionalModesTab> createState() => _AdditionalModesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdditionalModesTabCubit>()..getAdditionalModes(),
      child: this,
    );
  }
}

class _AdditionalModesTabState extends State<AdditionalModesTab> {
  AdditionalModesTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    AdditionalModesTabState state,
  ) {
    if (state.status == AdditionalModesTabStatus.error) {
      CleanDigitalToasts.of(context).showError(
        message: state.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<AdditionalModesTabCubit, AdditionalModesTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          switch (state.status) {
            case AdditionalModesTabStatus.error:
              return ErrorView(onPressed: cubit.getAdditionalModes);
            case AdditionalModesTabStatus.loading:
              return const Center(child: LoadingIndicator());
            case AdditionalModesTabStatus.success:
              return _buildSuccessBody(state);
          }
        },
      ),
    );
  }

  Widget _buildSuccessBody(AdditionalModesTabState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TitleWithButton(
          title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
              '${state.additionalModes.length}',
          onPressed: () =>
              CleanDigitalDialogs.of(context).showRegisterModeDialog(
            cubit.createAdditionalMode,
            true,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return _buildAdditionalMde(state, index);
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: state.additionalModes.length,
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalMde(AdditionalModesTabState state, int index) {
    return ListTile(
      title: EntityLabel(
        title: CleanDigitalLocalizations.of(context).name,
        value: state.additionalModes[index].name,
      ),
      isThreeLine: true,
      subtitle: _buildSubtitle(state, index),
      leading: const Icon(Icons.adf_scanner),
      trailing: _buildTrailing(state, index),
    );
  }

  Widget _buildSubtitle(AdditionalModesTabState state, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EntityLabel(
          title: CleanDigitalLocalizations.of(context).costs,
          value: state.additionalModes[index].costs,
        ),
        EntityLabel(
          title: CleanDigitalLocalizations.of(context).time,
          value: state.additionalModes[index].time,
        ),
      ],
    );
  }

  Widget _buildTrailing(AdditionalModesTabState state, int index) {
    return SizedBox(
      width: 10.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PrimaryButton(
            title: CleanDigitalLocalizations.of(context).edit,
            onPressed: () {
              CleanDigitalDialogs.of(context).showEditAdditionalModeDialog(
                state.additionalModes[index],
                (request) {
                  cubit.updateAdditionalMode(
                    state.additionalModes[index].additionalModeId,
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
              title: CleanDigitalLocalizations.of(context)
                  .doYouWantToDeleteAdditionalMode,
              onPressed: () => cubit.deleteAdditionalMode(
                state.additionalModes[index].additionalModeId,
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
