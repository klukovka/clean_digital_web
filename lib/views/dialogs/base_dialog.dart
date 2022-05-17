import 'dart:ui';

import 'package:flutter/material.dart';
import '../rounded_container.dart';

class BaseDialog extends StatelessWidget {
  final Widget body;
  final String title;
  final double? height;

  const BaseDialog._({
    Key? key,
    required this.body,
    required this.title,
    this.height,
  }) : super(key: key);

  static Widget create({
    required Widget body,
    required String title,
    double? height,
  }) {
    return BaseDialog._(
      body: body,
      title: title,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: RoundedContainer(
          height: height,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Theme.of(context).primaryColorDark,
                centerTitle: true,
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
