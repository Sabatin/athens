import 'dart:io';
import 'package:flutter/cupertino.dart';

class Routing {
  static Future<void> slideToPage(BuildContext context, Widget target,
      {dynamic arguments}) async {
    if (Platform.isIOS) {
      await Navigator.of(context, rootNavigator: true)
          .push(CupertinoPageRoute(builder: (context) {
        return target;
      }));
    } else {
      await Navigator.of(context, rootNavigator: true).push(PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 200),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (BuildContext context,
              Animation<double> firstAnimation,
              Animation<double> secondAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                  parent: firstAnimation,
                  curve: Curves.easeOutSine,
                  reverseCurve: Curves.easeOutSine.flipped)),
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> firstAnimation,
              Animation<double> secondAnimation) {
            return target;
          },
          settings: RouteSettings(
            arguments: arguments,
          )));
    }
  }
}
