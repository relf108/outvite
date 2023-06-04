import 'package:flutter/material.dart';

class StandardMargins {
  static edgeInsets(BuildContext context) {
    return EdgeInsets.fromLTRB(
        widthPercent(context),
        heightPercent(context, percent: 0.05),
        widthPercent(context),
        heightPercent(context));
  }

  static columnMargin(BuildContext context) {
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
