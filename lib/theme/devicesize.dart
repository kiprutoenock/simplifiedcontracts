import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double deviceWidth([double factor = 1]) {
    return MediaQuery.sizeOf(this).width * factor;
  }

  double deviceHeight([double factor = 1]) {
    return MediaQuery.sizeOf(this).height * factor;
  }
}