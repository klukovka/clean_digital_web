import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../services/backup_service.dart';
import '../../base_cubit.dart';

part 'admin_backups_tab_state.dart';

@injectable
class AdminBackupsTabCubit extends BaseCubit<AdminBackupsTabState> {
  final BackupService _backupService;

  AdminBackupsTabCubit(
    this._backupService,
  ) : super(const AdminBackupsTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminBackupsTabStatus.error,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: AdminBackupsTabStatus.loading));
    await makeErrorHandledCall(() async {
      emit(state.copyWith(
        status: AdminBackupsTabStatus.success,
        backups: await _backupService.getAllBackups(),
      ));
    });
  }

  Future<void> backup() async {
    emit(state.copyWith(status: AdminBackupsTabStatus.loadingButton));

    await makeErrorHandledCall(() async {
      await _backupService.backup();
      emit(state.copyWith(
        status: AdminBackupsTabStatus.created,
        backups: await _backupService.getAllBackups(),
      ));
    });
  }

  Future<void> restore(String backupId) async {
    emit(state.copyWith(status: AdminBackupsTabStatus.loading));

    await makeErrorHandledCall(() async {
      await _backupService.restore(backupId);
      emit(state.copyWith(status: AdminBackupsTabStatus.restored));
    });
  }
}
