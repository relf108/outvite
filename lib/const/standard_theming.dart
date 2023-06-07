import 'package:flutter/material.dart';

class StandardMargins {
  static topLevelMargin(BuildContext context) {
    return EdgeInsets.fromLTRB(
        widthPercent(context),
        heightPercent(context, percent: 0.05),
        widthPercent(context),
        heightPercent(context));
  }

  static columnItemMargin(BuildContext context) {
    return EdgeInsets.fromLTRB(
      0,
      heightPercent(context, percent: 0.01),
      0,
      0,
    );
  }

  static double heightPercent(BuildContext context, {double percent = 0.02}) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double widthPercent(BuildContext context, {double percent = 0.01}) {
    return MediaQuery.of(context).size.width * percent;
  }
}

class AdditionalColours {
  static const Color accept = Color.fromARGB(150, 61, 194, 119);
  static const Color decline = Color.fromARGB(150, 194, 61, 136);
}

class Animations {
  static Route transitionSlideUp(Widget nextView) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => nextView,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
