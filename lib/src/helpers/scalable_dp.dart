import 'package:flutter/material.dart';
import 'package:si_jaja/src/helpers/responsive.dart';

class SDP {
  static int? dimen;
  static double? width;
  static double? height;
  static BuildContext? context;

  static void init(BuildContext c) {
    context = c;
    width = MediaQuery.of(context!).size.width;
    height = MediaQuery.of(context!).size.height;
  }

  static double sdp(double dp) {
    var size = Responsive.isDesktop(context!)
        ? (dp / 900) * height!
        : Responsive.isTablet(context!)
            ? (dp / 700) * height!
            : Responsive.isMobileLarge(context!)
                ? (dp / 500) * height!
                : (dp / 300) * width!;
    return size;
  }
}
