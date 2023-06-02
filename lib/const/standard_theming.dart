import 'package:flutter/material.dart';

class StandardMargins {
  static edgeInsets(BuildContext context) {
    return EdgeInsets.fromLTRB(fromSides(context), fromTop(context),
        fromSides(context), fromBottom(context));
  }

  static columnMargin(BuildContext context) {
    return EdgeInsets.fromLTRB(
      0,
      fromTop(context, percent: 0.01),
      0,
      0,
    );
  }

  static double fromTop(BuildContext context, {double percent = 0.05}) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double fromBottom(BuildContext context, {double percent = 0.02}) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double fromSides(BuildContext context, {double percent = 0.01}) {
    return MediaQuery.of(context).size.width * percent;
  }
}
