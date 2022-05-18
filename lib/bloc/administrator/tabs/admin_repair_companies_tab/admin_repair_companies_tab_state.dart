part of 'admin_repair_companies_tab_cubit.dart';

enum AdminRepairCompaniesTabStatus {
  loading,
  error,
  success,
}

class AdminRepairCompaniesTabState extends Equatable {
  final AdminRepairCompaniesTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<RepairCompany> repairCompanies;

  const AdminRepairCompaniesTabState({
    this.status = AdminRepairCompaniesTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.repairCompanies = const [],
  });

  AdminRepairCompaniesTabState copyWith({
    AdminRepairCompaniesTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<RepairCompany>? repairCompanies,
  }) {
    return AdminRepairCompaniesTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      repairCompanies: repairCompanies ?? this.repairCompanies,
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
      repairCompanies,
    ];
  }
}
