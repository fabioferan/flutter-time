import 'package:flutter/material.dart';

class ChronosBreakpoints {
  ChronosBreakpoints._();

  static const double mobileMax = 768;
  static const double tabletMax = 1100;
  static const double maxContentWidth = 1440;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileMax;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= mobileMax && width < tabletMax;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletMax;
}
