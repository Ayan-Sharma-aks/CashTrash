import 'package:flutter/cupertino.dart';

class Constants {
  static double width(BuildContext context, double multiplier) {
    return MediaQuery.of(context).size.width / multiplier;
  }

  static double height(BuildContext context, double multiplier) {
    return MediaQuery.of(context).size.height / multiplier;
  }
}
