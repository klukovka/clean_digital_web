import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class AutoTabMenuItem {
  String title(BuildContext context);
  IconData get iconData;
  PageRouteInfo get route;
}
