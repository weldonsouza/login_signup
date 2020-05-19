import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget pageRoute;
  double directionHorizontal, directionVertical;

  SlideRoute(
      {this.pageRoute,
      this.directionHorizontal = -1,
      this.directionVertical = 0})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => pageRoute,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) => SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(directionHorizontal, directionVertical),
                          end: Offset.zero).animate(animation),
                  child: child)
        );
}
