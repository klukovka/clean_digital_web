part of 'repair_products_tab_cubit.dart';

enum RepairProductsTabStatus {
  loading,
  error,
  success,
}

class RepairProductsTabState extends Equatable {
  final RepairProductsTabStatus status;
  final String errorMessage;
  final int totalElements;
  final List<RepairProduct> repairProducts;

  const RepairProductsTabState({
    this.status = RepairProductsTabStatus.loading,
    this.errorMessage = '',
    this.totalElements = 0,
    this.repairProducts = const [],
  });

  RepairProductsTabState copyWith({
    RepairProductsTabStatus? status,
    String? errorMessage,
    int? totalElements,
    List<RepairProduct>? repairProducts,
  }) {
    return RepairProductsTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      totalElements: totalElements ?? this.totalElements,
      repairProducts: repairProducts ?? this.repairProducts,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      totalElements,
      repairProducts,
    ];
  }
}
