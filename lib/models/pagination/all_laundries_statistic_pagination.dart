import 'package:json_annotation/json_annotation.dart';

import '../statistic/all_laundry_statistic.dart';
import 'pagination.dart';

class AllLaundryStatisticPagination extends Pagination {
  @JsonKey(name: 'content')
  final List<AllLaundryStatistic> statistic;

  const AllLaundryStatisticPagination({
    required this.statistic,
    required int page,
    required int size,
    required int totalElements,
    required int totalPages,
  }) : super(
          page: page,
          size: size,
          totalElements: totalElements,
          totalPages: totalPages,
        );
}
