import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../l10n/clean_digital_localizations.dart';
import '../../views/buttons/primary_button.dart';
import '../../views/error_view.dart';
import '../../views/loading_indicator.dart';

class CleanDigitalPagedBuilderDelegate<ItemType>
    extends PagedChildBuilderDelegate<ItemType> {
  final Widget? noItemsFoundIndicator;
  final PagingController<int, ItemType> pagingController;
  final String? noMoreItemsIndicatorText;
  final WidgetBuilder? newPageErrorBuilder;

  CleanDigitalPagedBuilderDelegate({
    required ItemWidgetBuilder<ItemType> itemBuilder,
    required this.pagingController,
    this.noItemsFoundIndicator,
    this.noMoreItemsIndicatorText,
    this.newPageErrorBuilder,
  }) : super(itemBuilder: itemBuilder);

  @override
  WidgetBuilder? get noItemsFoundIndicatorBuilder {
    return (BuildContext context) {
      return Center(
        child: noItemsFoundIndicator,
      );
    };
  }

  @override
  WidgetBuilder? get noMoreItemsIndicatorBuilder {
    final noMoreItemsText = noMoreItemsIndicatorText;
    if (noMoreItemsText == null) return null;
    return (BuildContext context) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            noMoreItemsText,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      );
    };
  }

  @override
  WidgetBuilder? get firstPageProgressIndicatorBuilder {
    return (BuildContext context) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: LoadingIndicator(
          size: 48,
        ),
      );
    };
  }

  @override
  WidgetBuilder? get newPageProgressIndicatorBuilder {
    return (BuildContext context) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: LoadingIndicator(),
      );
    };
  }

  @override
  WidgetBuilder? get newPageErrorIndicatorBuilder {
    final errorBuilder = newPageErrorBuilder;

    return (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: pagingController.retryLastFailedRequest,
        child: errorBuilder == null
            ? _buildRetryErrorIndicator(context)
            : errorBuilder(context),
      );
    };
  }

  Widget _buildRetryErrorIndicator(BuildContext context) {
    final localizations = CleanDigitalLocalizations.of(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              localizations.pageLoadError,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            const Icon(
              Icons.replay_outlined,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  @override
  WidgetBuilder? get firstPageErrorIndicatorBuilder {
    return (BuildContext context) {
      return ErrorView(
        onPressed: pagingController.retryLastFailedRequest,
      );
    };
  }
}
