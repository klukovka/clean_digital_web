import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Axis axis;

  const ExpandedSection({
    Key? key,
    required this.child,
    this.expand = false,
    this.axis = Axis.vertical,
  }) : super(key: key);

  @override
  State<ExpandedSection> createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _expandController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: widget.axis,
      sizeFactor: _animation,
      child: widget.child,
    );
  }
}
