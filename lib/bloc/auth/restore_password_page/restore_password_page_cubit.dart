import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../services/auth_service.dart';
import '../../base_cubit.dart';

part 'restore_password_page_state.dart';

@injectable
class RestorePasswordPageCubit extends BaseCubit<RestorePasswordPageState> {
  final AuthService _authService;

  RestorePasswordPageCubit(
    this._authService,
  ) : super(const RestorePasswordPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: RestorePasswordPageStatus.error,
    ));
  }

  Future<void> restore(String email) async {
    emit(state.copyWith(status: RestorePasswordPageStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.restorePassword(email);
      emit(state.copyWith(status: RestorePasswordPageStatus.success));
    });
  }
}
