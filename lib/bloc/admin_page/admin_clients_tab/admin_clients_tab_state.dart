part of 'admin_clients_tab_cubit.dart';

enum AdminClientsTabStatus {
  loading,
  error,
  success,
}

class AdminClientsTabState extends Equatable {
  final AdminClientsTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<Client> clients;

  const AdminClientsTabState({
    this.status = AdminClientsTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.clients = const [],
  });

  AdminClientsTabState copyWith({
    AdminClientsTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<Client>? clients,
  }) {
    return AdminClientsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      clients: clients ?? this.clients,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      page,
      totalPages,
      totalElements,
      clients,
    ];
  }
}
