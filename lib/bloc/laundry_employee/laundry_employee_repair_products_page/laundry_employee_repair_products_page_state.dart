part of 'laundry_employee_repair_products_page_cubit.dart';

enum LaundryEmployeeRepairProductsPageStatus {
  loading,
  error,
  success,
}

class LaundryEmployeeRepairProductsPageState extends Equatable {
  final LaundryEmployeeRepairProductsPageStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final int totalElements;
  final List<RepairProduct> products;

  const LaundryEmployeeRepairProductsPageState({
    this.status = LaundryEmployeeRepairProductsPageStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.totalElements = 0,
    this.products = const [],
  });

  LaundryEmployeeRepairProductsPageState copyWith({
    LaundryEmployeeRepairProductsPageStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    int? totalElements,
    List<RepairProduct>? products,
  }) {
    return LaundryEmployeeRepairProductsPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalElements: totalElements ?? this.totalElements,
      products: products ?? this.products,
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
      products,
    ];
  }
}
