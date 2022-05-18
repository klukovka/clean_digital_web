import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../models/client.dart';
import '../../../services/auth_service.dart';
import '../../../services/clients_service.dart';
import '../../base_cubit.dart';

part 'admin_clients_tab_state.dart';

@injectable
class AdminClientsTabCubit extends BaseCubit<AdminClientsTabState> {
  final ClientsService _clientsService;
  final AuthService _authService;

  AdminClientsTabCubit(
    this._clientsService,
    this._authService,
  ) : super(const AdminClientsTabState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: AdminClientsTabStatus.error,
    ));
  }

  void reset() {
    emit(const AdminClientsTabState());
  }

  Future<void> getClients({int page = 0}) async {
    emit(state.copyWith(
      page: page,
      status: AdminClientsTabStatus.loading,
    ));
    await makeErrorHandledCall(() async {
      final clients = await _clientsService.getAllClients(
        page: page,
      );
      emit(state.copyWith(
        status: AdminClientsTabStatus.success,
        totalPages: clients.totalPages,
        clients: clients.clients,
        totalElements: clients.totalElements,
      ));
    });
  }

  Future<void> deteleClient(String userId) async {
    emit(state.copyWith(status: AdminClientsTabStatus.loading));
    await makeErrorHandledCall(() async {
      await _authService.deleteUser(userId);
    });
    reset();
  }
}
