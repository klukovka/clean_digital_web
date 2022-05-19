import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/laundry.dart';
import '../../../services/laundries_service.dart';
import '../../base_cubit.dart';

part 'admin_laundry_page_state.dart';

@injectable
class AdminLaundryPageCubit extends BaseCubit<AdminLaundryPageState> {
  final LaundriesService _laundriesService;
  late final String _laundryId;

  AdminLaundryPageCubit(
    this._laundriesService,
    @factoryParam String laundryId,
  ) : super(const AdminLaundryPageState()) {
    _laundryId = laundryId;
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminLaundryPageStatus.error,
    ));
  }

  Future<void> init() async {
    await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: AdminLaundryPageStatus.success,
        laundry: await _laundriesService.getLaundryById(
          _laundryId,
        ),
      ));
    });
  }
}
