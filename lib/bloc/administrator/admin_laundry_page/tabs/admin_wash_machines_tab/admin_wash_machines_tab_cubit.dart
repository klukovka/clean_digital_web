import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../models/wash_machine.dart';
import '../../../../../services/laundries_service.dart';
import '../../../../base_cubit.dart';

part 'admin_wash_machines_tab_state.dart';

@injectable
class AdminWashMachinesTabCubit extends BaseCubit<AdminWashMachinesTabState> {
  final LaundriesService _laundriesService;
  late final String _laundryId;

  AdminWashMachinesTabCubit(
    this._laundriesService,
    @factoryParam String? laundryId,
  ) : super(const AdminWashMachinesTabState()) {
    _laundryId = laundryId!;
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminWashMachinesTabStatus.error,
    ));
  }

  void reset() {
    emit(const AdminWashMachinesTabState());
  }

  Future<void> getWashMachines({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminWashMachinesTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final washMachines = await _laundriesService.getLaundryWashMachines(
        laundryId: _laundryId,
        page: page,
      );
      emit(state.copyWith(
        status: AdminWashMachinesTabStatus.success,
        totalPages: washMachines.totalPages,
        washMachines: washMachines.washMachines,
        totalElements: washMachines.totalElements,
      ));
    });
  }
}
