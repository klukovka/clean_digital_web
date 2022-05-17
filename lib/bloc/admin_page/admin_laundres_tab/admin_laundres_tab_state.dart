part of 'admin_laundres_tab_cubit.dart';

enum AdminLaundriesTabStatus {
  loading,
  error,
  success,
}

class AdminLaundriesTabState extends Equatable {
  final AdminLaundriesTabStatus status;
  final String errorMessage;
  final int page;
  final int totalPages;
  final List<Laundry> laundries;

  const AdminLaundriesTabState({
    this.status = AdminLaundriesTabStatus.loading,
    this.errorMessage = '',
    this.page = 0,
    this.totalPages = 0,
    this.laundries = const [],
  });

  AdminLaundriesTabState copyWith({
    AdminLaundriesTabStatus? status,
    String? errorMessage,
    int? page,
    int? totalPages,
    List<Laundry>? laundries,
  }) {
    return AdminLaundriesTabState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      laundries: laundries ?? this.laundries,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      page,
      totalPages,
      laundries,
    ];
  }
}
