part of 'mode_tab_cubit.dart';

enum ModesTabStatus {
  loading,
  error,
  success,
}

class ModesTabState extends Equatable {
  final ModesTabStatus status;
  final String errorMessage;
  final int totalElements;
  final List<Mode> modes;

  const ModesTabState({
    this.status = ModesTabStatus.loading,
    this.errorMessage = '',
    this.totalElements = 0,
    this.modes = const [],
  });

  ModesTabState copyWith({
    ModesTabStatus? status,
    String? errorMessage,
    int? totalElements,
    List<Mode>? modes,
  }) {
    return ModesTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      totalElements: totalElements ?? this.totalElements,
      modes: modes ?? this.modes,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      totalElements,
      modes,
    ];
  }
}
