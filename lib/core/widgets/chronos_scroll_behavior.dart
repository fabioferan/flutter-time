import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Desktop & Web Smooth ScrollBehavior enabling all pointer devices and high-precision scrolling
class ChronosScrollBehavior extends MaterialScrollBehavior {
  const ChronosScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return RawScrollbar(
      controller: details.controller,
      thumbVisibility: true,
      thickness: 6,
      radius: const Radius.circular(8),
      fadeDuration: const Duration(milliseconds: 300),
      timeToFade: const Duration(milliseconds: 1200),
      child: child,
    );
  }
}
