import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

import '../utils/pagination/clean_digital_paged_builder_delegate.dart';

class CleanDigitalPagedGridView<T> extends StatefulWidget {
  final Future<void> Function(int page) fetchPage;
  final Widget Function(T) itemBuilder;
  final Widget Function(
    Widget pagedView,
    PagingController<int, T> controller,
  ) builder;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Widget? noItemsFoundIndicator;
  final String? noMoreItemsIndicatorText;
  final ValueSetter<PagingController<int, T>>? onPagingControllerInitialized;
  final double? width;

  const CleanDigitalPagedGridView({
    Key? key,
    required this.fetchPage,
    required this.itemBuilder,
    required this.builder,
    this.scrollController,
    this.scrollPhysics,
    this.noItemsFoundIndicator,
    this.noMoreItemsIndicatorText,
    this.onPagingControllerInitialized,
    this.width,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  State<CleanDigitalPagedGridView<T>> createState() =>
      _CleanDigitalPagedGridViewState<T>();
}

class _CleanDigitalPagedGridViewState<T>
    extends State<CleanDigitalPagedGridView<T>> {
  final PagingController<int, T> _pagingController =
      PagingController<int, T>(firstPageKey: 0);
  bool onFirstPage = true;

  int get _crossAxisCount {
    final width = widget.width ?? 100.w;
    if (width < 800) return 1;
    if (width < 1400) return 2;
    return 3;
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
    widget.onPagingControllerInitialized?.call(_pagingController);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (pageKey != 0) {
      onFirstPage = false;
    }
    await widget.fetchPage(pageKey);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_buildBody(), _pagingController);
  }

  Widget _buildBody() {
    return PagedGridView<int, T>(
      shrinkWrap: widget.shrinkWrap,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      padding: EdgeInsets.zero,
      scrollController: widget.scrollController,
      physics: widget.scrollPhysics,
      pagingController: _pagingController,
      builderDelegate: CleanDigitalPagedBuilderDelegate(
        pagingController: _pagingController,
        itemBuilder: (context, T item, index) => widget.itemBuilder(item),
        noItemsFoundIndicator: widget.noItemsFoundIndicator,
        noMoreItemsIndicatorText:
            onFirstPage ? null : widget.noMoreItemsIndicatorText,
      ),
    );
  }
}
