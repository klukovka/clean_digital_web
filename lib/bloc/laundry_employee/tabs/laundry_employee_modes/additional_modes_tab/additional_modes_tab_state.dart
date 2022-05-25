part of 'additional_modes_tab_cubit.dart';

enum AdditionalModesTabStatus {
  loading,
  error,
  success,
}

class AdditionalModesTabState extends Equatable {
  final AdditionalModesTabStatus status;
  final String errorMessage;
  final int totalElements;
  final List<AdditionalMode> additionalModes;

  const AdditionalModesTabState({
    this.status = AdditionalModesTabStatus.loading,
    this.errorMessage = '',
    this.totalElements = 0,
    this.additionalModes = const [],
  });

  AdditionalModesTabState copyWith({
    AdditionalModesTabStatus? status,
    String? errorMessage,
    int? totalElements,
    List<AdditionalMode>? additionalModes,
  }) {
    return AdditionalModesTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      totalElements: totalElements ?? this.totalElements,
      additionalModes: additionalModes ?? this.additionalModes,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      totalElements,
      additionalModes,
    ];
  }
}
