part of 'admin_repair_product_view_cubit.dart';

enum AdminRepairProductsViewStatus {
  loading,
  error,
  success,
}

class AdminRepairProductsViewState extends Equatable {
  final AdminRepairProductsViewStatus status;
  final String errorMessage;
  final List<RepairProduct> products;

  const AdminRepairProductsViewState({
    this.status = AdminRepairProductsViewStatus.loading,
    this.errorMessage = '',
    this.products = const [],
  });

  AdminRepairProductsViewState copyWith({
    AdminRepairProductsViewStatus? status,
    String? errorMessage,
    List<RepairProduct>? products,
  }) {
    return AdminRepairProductsViewState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, products];
}
