import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool isActive;
  final VoidCallback? onPressed;

  const DrawerItem({
    Key? key,
    required this.iconData,
    required this.title,
    this.isActive = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 16, 0),
      child: ListTile(
        selected: isActive,
        onTap: onPressed,
        leading: Icon(iconData),
        iconColor: Theme.of(context).colorScheme.onBackground,
        selectedColor: Theme.of(context).backgroundColor,
        tileColor: Colors.transparent,
        selectedTileColor: Theme.of(context).colorScheme.onBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isActive
                    ? Theme.of(context).backgroundColor
                    : Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
