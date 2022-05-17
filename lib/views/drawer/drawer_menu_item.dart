import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class DrawerMenuItem {
  String title(BuildContext context);
  IconData get iconData;
  PageRouteInfo get route;
}
