import 'package:flutter/material.dart';

import '../colors.dart';

class Job2GoTextStyle {
  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 21, color: Colors.white, fontWeight: FontWeight.w500);
  }

  static TextStyle bodyBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 14,
        color: Job2goPalette.blackFont,
        fontWeight: FontWeight.w500);
  }
}
