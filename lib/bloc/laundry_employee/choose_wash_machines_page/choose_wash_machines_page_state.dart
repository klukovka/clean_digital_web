part of 'choose_wash_machines_page_cubit.dart';

enum ChooseWashMachinesPageStatus {
  loading,
  error,
  success,
}

class ChooseWashMachinesPageState extends Equatable {
  final ChooseWashMachinesPageStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<WashMachine> washMachines;

  const ChooseWashMachinesPageState({
    this.status = ChooseWashMachinesPageStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.washMachines = const [],
  });

  ChooseWashMachinesPageState copyWith({
    ChooseWashMachinesPageStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<WashMachine>? washMachines,
  }) {
    return ChooseWashMachinesPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      washMachines: washMachines ?? this.washMachines,
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
      washMachines,
    ];
  }
}
