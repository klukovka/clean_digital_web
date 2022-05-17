import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

void proccessNextPage<T>({
  required PagingController<int, T> controller,
  required int page,
  required int totalPages,
  required List<T> items,
  T? lastItem,
}) {
  try {
    final isLastPage = page == totalPages - 1;
    if (isLastPage) {
      if (lastItem != null) {
        items.add(lastItem);
      }
      controller.appendLastPage(items);
    } else {
      final nextPage = page + 1;
      controller.appendPage(items, nextPage);
    }
  } catch (error) {
    controller.error = error;
  }
}
