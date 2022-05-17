import 'package:flutter/material.dart';

abstract class DrawerMenuItem {
  String title(BuildContext context);
  IconData get iconData;
}
