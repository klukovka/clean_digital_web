import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedContainer extends StatefulWidget {
  final Widget child;

  const RoundedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<RoundedContainer> createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {
  double? get _width {
    final width = 100.w;
    if (width < 480) return null;
    if (width < 1000) return 50.w;
    return 30.w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      margin: const EdgeInsets.all(16),
      width: _width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColorLight.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -1),
          ),
          BoxShadow(
            color: Theme.of(context).primaryColorLight.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
