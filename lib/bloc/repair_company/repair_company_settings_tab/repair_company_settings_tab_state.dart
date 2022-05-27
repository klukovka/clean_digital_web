part of 'repair_company_settings_tab_cubit.dart';

enum RepairCompanySettingsTabStatus {
  loading,
  success,
  error,
  deleted,
}

class RepairCompanySettingsTabState extends Equatable {
  final RepairCompanySettingsTabStatus status;
  final String errorMessage;
  final RepairCompany repairCompany;

  const RepairCompanySettingsTabState({
    this.repairCompany = const RepairCompany.empty(),
    this.status = RepairCompanySettingsTabStatus.loading,
    this.errorMessage = '',
  });

  RepairCompanySettingsTabState copyWith({
    RepairCompanySettingsTabStatus? status,
    String? errorMessage,
    RepairCompany? repairCompany,
  }) {
    return RepairCompanySettingsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      repairCompany: repairCompany ?? this.repairCompany,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, repairCompany];
}
