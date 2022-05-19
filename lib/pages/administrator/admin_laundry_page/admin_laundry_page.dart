import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/administrator/admin_laundry_page/admin_laundry_page_cubit.dart';
import '../../../di/injection_container.dart';
import '../../../router/clean_digital_router.dart';
import '../../../utils/clean_digital_toasts.dart';
import '../../../views/auto_tab_views/auto_tabs_view.dart';
import '../../../views/loading_indicator.dart';
import 'admin_laundry_page_tab_item.dart';

class AdminLaundryPage extends StatelessWidget implements AutoRouteWrapper {
  final String laundryId;

  const AdminLaundryPage({
    Key? key,
    @PathParam('laundryId') required this.laundryId,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AdminLaundryPageCubit>(
        param1: laundryId,
      )..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsView(
      items: AdminLaundryPageTabItem.values,
      onBackPressed: router.replaceAdminMainPage,
      title: _buildTitle(),
    );
  }

  void _onStateChanged(
    BuildContext context,
    AdminLaundryPageState state,
  ) {
    if (AdminLaundryPageStatus.error == state.status) {
      CleanDigitalToasts.of(context).showError(
        message: state.errorMessage,
      );
    }
  }

  Widget _buildTitle() {
    return BlocConsumer<AdminLaundryPageCubit, AdminLaundryPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        switch (state.status) {
          case AdminLaundryPageStatus.error:
            return const SizedBox.shrink();
          case AdminLaundryPageStatus.loading:
            return const LoadingIndicator();
          case AdminLaundryPageStatus.success:
            return Text(
              '${state.laundry.name} (${state.laundry.laundryId})',
            );
        }
      },
    );
  }
}
