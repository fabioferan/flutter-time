import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chronos_colors.dart';

/// Typography definitions using Space Grotesk, Geist (or Inter fallback) and JetBrains Mono
class ChronosTypography {
  ChronosTypography._();

  // JetBrains Mono for Digits, Timers & Telemetry with tabular figures
  static TextStyle displayXl = GoogleFonts.jetBrainsMono(
    fontSize: 72,
    fontWeight: FontWeight.w700,
    height: 80 / 72,
    letterSpacing: -2.16,
    color: ChronosColors.onSurface,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle displayLg = GoogleFonts.jetBrainsMono(
    fontSize: 56,
    fontWeight: FontWeight.w600,
    height: 64 / 56,
    letterSpacing: -1.12,
    color: ChronosColors.onSurface,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle monoNumericLg = GoogleFonts.jetBrainsMono(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: ChronosColors.onSurface,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle labelLg = GoogleFonts.jetBrainsMono(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.28,
    color: ChronosColors.onSurface,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle labelMd = GoogleFonts.jetBrainsMono(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: 0.48,
    color: ChronosColors.onSurfaceVariant,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle labelSm = GoogleFonts.jetBrainsMono(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 14 / 10,
    letterSpacing: 0.6,
    color: ChronosColors.outline,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  // Space Grotesk for Architectural Headings
  static TextStyle headlineLg = GoogleFonts.spaceGrotesk(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 40 / 32,
    letterSpacing: -0.64,
    color: ChronosColors.onSurface,
  );

  static TextStyle headlineMd = GoogleFonts.spaceGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -0.24,
    color: ChronosColors.onSurface,
  );

  static TextStyle headlineSm = GoogleFonts.spaceGrotesk(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 28 / 20,
    letterSpacing: 0,
    color: ChronosColors.onSurface,
  );

  // Geist / Inter for Clean Body Text
  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: ChronosColors.onSurface,
  );

  static TextStyle bodyMd = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: ChronosColors.onSurfaceVariant,
  );

  static TextStyle bodySm = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    letterSpacing: 0.12,
    color: ChronosColors.outline,
  );
}
