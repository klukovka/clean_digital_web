import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../bloc/laundry_employee/choose_wash_machines_page/choose_wash_machines_page_cubit.dart';
import '../../di/injection_container.dart';
import '../../l10n/clean_digital_localizations.dart';
import '../../models/wash_machine.dart';
import '../../router/clean_digital_router.dart';
import '../../utils/clean_digital_toasts.dart';
import '../../utils/pagination/pagination_utils.dart';
import '../../views/clean_digital_paged_grid_view.dart';
import '../../views/entity_tiles/wash_machine_tile.dart';
import '../../views/title_with_button.dart';

class ChooseWashMachinesPage extends StatefulWidget
    implements AutoRouteWrapper {
  final ValueSetter<WashMachine> onChosen;

  const ChooseWashMachinesPage({
    Key? key,
    required this.onChosen,
  }) : super(key: key);

  @override
  State<ChooseWashMachinesPage> createState() => _ChooseWashMachinesPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ChooseWashMachinesPageCubit>(),
      child: this,
    );
  }
}

class _ChooseWashMachinesPageState extends State<ChooseWashMachinesPage>
    with AutoRouteAware {
  AutoRouteObserver? _observer;
  late UniqueKey _paginatedListKey;

  ChooseWashMachinesPageCubit get cubit => context.read();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _observer = router.getObserver<AutoRouteObserver>(context);
    if (_observer != null) {
      _observer?.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    _observer?.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeTabRoute(TabPageRoute tabPageRoute) {
    cubit.reset();
    _paginatedListKey = UniqueKey();
  }

  @override
  void initState() {
    super.initState();
    _paginatedListKey = UniqueKey();
  }

  Future<void> _fetchPage(int pageKey) async {
    await context.read<ChooseWashMachinesPageCubit>().getWashMachines(
          page: pageKey,
        );
  }

  void _onStateChanged(
    ChooseWashMachinesPageState state,
    PagingController<int, WashMachine> controller,
  ) {
    switch (state.status) {
      case ChooseWashMachinesPageStatus.success:
        controller.error = null;
        proccessNextPage<WashMachine>(
          controller: controller,
          page: state.page,
          totalPages: state.totalPages,
          items: state.washMachines,
        );
        break;
      case ChooseWashMachinesPageStatus.error:
        controller.error = state.errorMessage;
        CleanDigitalToasts.of(context).showError(
          message: state.errorMessage,
        );
        break;
      case ChooseWashMachinesPageStatus.loading:
        controller.error = null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CleanDigitalLocalizations.of(context).chooseOne),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: BlocBuilder<ChooseWashMachinesPageCubit,
            ChooseWashMachinesPageState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 32),
                _buildTitle(state),
                const SizedBox(height: 32),
                Expanded(
                  child: Align(
                    alignment: state.washMachines.isEmpty
                        ? Alignment.center
                        : Alignment.topCenter,
                    child: _buildLaundriesGrid(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle(ChooseWashMachinesPageState state) {
    return TitleWithButton(
      title: '${CleanDigitalLocalizations.of(context).totalAmount}: '
          '${state.totalElements}',
    );
  }

  Widget _buildLaundriesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CleanDigitalPagedGridView<WashMachine>(
        key: _paginatedListKey,
        fetchPage: _fetchPage,
        shrinkWrap: true,
        itemBuilder: (washMachine) {
          return WashMachineTile(
            moreText: CleanDigitalLocalizations.of(context).choose,
            washMachine: washMachine,
            onMorePressed: washMachine.isWorking
                ? () {
                    widget.onChosen(washMachine);
                    router.pop();
                  }
                : null,
          );
        },
        builder: (pagedView, controller) {
          return BlocListener<ChooseWashMachinesPageCubit,
              ChooseWashMachinesPageState>(
            listener: (context, state) {
              _onStateChanged(state, controller);
            },
            child: pagedView,
          );
        },
        noItemsFoundIndicator: Text(
          CleanDigitalLocalizations.of(context).noMoreItems,
        ),
      ),
    );
  }
}
