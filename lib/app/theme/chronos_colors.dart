import 'package:flutter/material.dart';

/// Design tokens extracted directly from Chronos Precision (Stitch project).
class ChronosColors {
  ChronosColors._();

  // Background & Surfaces
  static const Color background = Color(0xFF0B1326);
  static const Color surface = Color(0xFF0B1326);
  static const Color surfaceDim = Color(0xFF0B1326);
  static const Color surfaceBright = Color(0xFF31394D);
  static const Color surfaceContainerLowest = Color(0xFF060E20);
  static const Color surfaceContainerLow = Color(0xFF131B2E);
  static const Color surfaceContainer = Color(0xFF171F33);
  static const Color surfaceContainerHigh = Color(0xFF222A3D);
  static const Color surfaceContainerHighest = Color(0xFF2D3449);
  static const Color surfaceVariant = Color(0xFF2D3449);

  // Content / On-Surfaces
  static const Color onSurface = Color(0xFFDAE2FD);
  static const Color onSurfaceVariant = Color(0xFFC3C6D7);
  static const Color onBackground = Color(0xFFDAE2FD);
  static const Color outline = Color(0xFF8D90A0);
  static const Color outlineVariant = Color(0xFF434655);

  // Brand Primaries (Royal Cobalt / Chrono Blue)
  static const Color primary = Color(0xFFB4C5FF);
  static const Color primaryContainer = Color(0xFF2563EB);
  static const Color onPrimary = Color(0xFF002A78);
  static const Color onPrimaryContainer = Color(0xFFEEEFFF);
  static const Color inversePrimary = Color(0xFF0053DB);
  static const Color surfaceTint = Color(0xFFB4C5FF);

  // Secondary Accents (Electric Sky)
  static const Color secondary = Color(0xFF7BD0FF);
  static const Color secondaryContainer = Color(0xFF00A6E0);
  static const Color onSecondary = Color(0xFF00354A);
  static const Color onSecondaryContainer = Color(0xFF00374D);

  // Tertiary / Urgency / Warning (Amber Precision)
  static const Color tertiary = Color(0xFFFFB95F);
  static const Color tertiaryContainer = Color(0xFF996100);
  static const Color onTertiary = Color(0xFF472A00);
  static const Color onTertiaryContainer = Color(0xFFFFEEDD);

  // Destructive / Error
  static const Color error = Color(0xFFFFB4AB);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onError = Color(0xFF690005);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  // Glassmorphic Overlays & Borders
  static const Color glassBorder = Color(0x1FFFFFFF); // 12% white rim
  static const Color glassPanel = Color(0xB2171F33); // 70% opacity surfaceContainer
  static const Color glowCobalt = Color(0x592563EB); // subtle cobalt ambient
  static const Color glowSky = Color(0x5938BDF8); // subtle sky ambient
}
