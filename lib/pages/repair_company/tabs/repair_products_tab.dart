import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/repair_company/repair_products_tab/repair_products_tab_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../l10n/clean_digital_localizations.dart';
import '../../../utils/clean_digital_dialogs.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../views/entity_tiles/repair_product_tile.dart';
import '../../../views/error_view.dart';
import '../../../views/loading_indicator.dart';
import '../../../views/title_with_button.dart';

class RepairProductsTab extends StatefulWidget with AutoRouteWrapper {
  const RepairProductsTab({Key? key}) : super(key: key);

  @override
  State<RepairProductsTab> createState() => _RepairProductsTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<RepairProductsTabCubit>()..getRepairProducts(),
      child: this,
    );
  }
}

class _RepairProductsTabState extends State<RepairProductsTab> {
  RepairProductsTabCubit get cubit => context.read();

  void _onStateChanged(
    BuildContext context,
    RepairProductsTabState state,
  ) {
    if (state.status == RepairProductsTabStatus.error) {
      CleanDigitalToasts.of(context).showError(
        message: state.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocConsumer<RepairProductsTabCubit, RepairProductsTabState>(
        listener: _onStateChanged,
        builder: (context, state) {
          switch (state.status) {
            case RepairProductsTabStatus.error:
              return ErrorView(onPressed: cubit.getRepairProducts);
            case RepairProductsTabStatus.loading:
              return const Center(child: LoadingIndicator());
            case RepairProductsTabStatus.success:
              return _buildSuccessBody(state);
          }
        },
      ),
    );
  }

  Widget _buildSuccessBody(RepairProductsTabState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TitleWithButton(
          title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
              '${state.totalElements}',
          onPressed: () {
            CleanDigitalDialogs.of(context)
                .showCreateRepairProductDialog(cubit.createRepairProduct);
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return RepairProductTile(
                repairProduct: state.repairProducts[index],
                isEdit: true,
                onMorePressed: () async {
                  CleanDigitalDialogs.of(context).showEditRepairProductDialog(
                    state.repairProducts[index],
                    (value) {
                      cubit.updateRepairProduct(
                          state.repairProducts[index].repairProductId, value);
                    },
                  );
                },
                onDeletePressed: () async {
                  cubit.deleteRepairProduct(
                      state.repairProducts[index].repairProductId);
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: state.totalElements,
          ),
        ),
      ],
    );
  }
}
