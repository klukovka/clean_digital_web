import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../bloc/administrator/tabs/admin_repair_companies_tab/admin_repair_product_view/admin_repair_product_view_cubit.dart';
import '../../../../../di/injection_container.dart';
import '../../../../../views/entity_tiles/repair_product_tile.dart';
import '../../../../../views/error_view.dart';
import '../../../../../views/expanded_section.dart';
import '../../../../../views/loading_indicator.dart';

class RepairProductsView extends StatefulWidget {
  final String companyId;
  final VoidCallback onPressed;

  static Widget create({
    required VoidCallback onPressed,
    required String companyId,
  }) {
    return BlocProvider(
      create: (_) => locator<AdminRepairProductsViewCubit>(param1: companyId),
      child: RepairProductsView._(companyId: companyId, onPressed: onPressed),
    );
  }

  const RepairProductsView._({
    Key? key,
    required this.companyId,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<RepairProductsView> createState() => _RepairProductsViewState();
}

class _RepairProductsViewState extends State<RepairProductsView> {
  AdminRepairProductsViewCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          locator<AdminRepairProductsViewCubit>(param1: widget.companyId),
      child: Builder(builder: (context) {
        return ExpandedSection(
          expand: true,
          axis: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 30.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: widget.onPressed,
                  icon: const Icon(Icons.close),
                ),
                Expanded(child: _buildBody()),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AdminRepairProductsViewCubit,
        AdminRepairProductsViewState>(
      builder: (context, state) {
        switch (state.status) {
          case AdminRepairProductsViewStatus.error:
            return ErrorView(onPressed: cubit.init);
          case AdminRepairProductsViewStatus.loading:
            return const Center(child: LoadingIndicator());
          case AdminRepairProductsViewStatus.success:
            return SingleChildScrollView(
              child: Column(
                children: state.products.map((repairProduct) {
                  return RepairProductTile(repairProduct: repairProduct);
                }).toList(),
              ),
            );
        }
      },
    );
  }
}
