import 'package:flutter/material.dart';
import 'chronos_colors.dart';
import 'chronos_typography.dart';

class ChronosTheme {
  ChronosTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ChronosColors.background,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: ChronosColors.primary,
        onPrimary: ChronosColors.onPrimary,
        primaryContainer: ChronosColors.primaryContainer,
        onPrimaryContainer: ChronosColors.onPrimaryContainer,
        secondary: ChronosColors.secondary,
        onSecondary: ChronosColors.onSecondary,
        secondaryContainer: ChronosColors.secondaryContainer,
        onSecondaryContainer: ChronosColors.onSecondaryContainer,
        tertiary: ChronosColors.tertiary,
        onTertiary: ChronosColors.onTertiary,
        tertiaryContainer: ChronosColors.tertiaryContainer,
        onTertiaryContainer: ChronosColors.onTertiaryContainer,
        error: ChronosColors.error,
        onError: ChronosColors.onError,
        errorContainer: ChronosColors.errorContainer,
        onErrorContainer: ChronosColors.onErrorContainer,
        surface: ChronosColors.surface,
        onSurface: ChronosColors.onSurface,
        surfaceContainerLowest: ChronosColors.surfaceContainerLowest,
        surfaceContainerLow: ChronosColors.surfaceContainerLow,
        surfaceContainer: ChronosColors.surfaceContainer,
        surfaceContainerHigh: ChronosColors.surfaceContainerHigh,
        surfaceContainerHighest: ChronosColors.surfaceContainerHighest,
        outline: ChronosColors.outline,
        outlineVariant: ChronosColors.outlineVariant,
      ),
      textTheme: TextTheme(
        displayLarge: ChronosTypography.displayLg,
        headlineLarge: ChronosTypography.headlineLg,
        headlineMedium: ChronosTypography.headlineMd,
        headlineSmall: ChronosTypography.headlineSm,
        bodyLarge: ChronosTypography.bodyLg,
        bodyMedium: ChronosTypography.bodyMd,
        bodySmall: ChronosTypography.bodySm,
        labelLarge: ChronosTypography.labelLg,
        labelMedium: ChronosTypography.labelMd,
        labelSmall: ChronosTypography.labelSm,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: const WidgetStatePropertyAll(true),
        trackVisibility: const WidgetStatePropertyAll(false),
        radius: const Radius.circular(8),
        thickness: const WidgetStatePropertyAll(6),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return ChronosColors.secondary.withValues(alpha: 0.6);
          }
          return ChronosColors.outlineVariant.withValues(alpha: 0.5);
        }),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: ChronosColors.surfaceContainerLowest,
        selectedIconTheme: IconThemeData(color: ChronosColors.primary, size: 22),
        unselectedIconTheme: IconThemeData(color: ChronosColors.outline, size: 22),
        selectedLabelTextStyle: TextStyle(color: ChronosColors.primary, fontSize: 11, fontWeight: FontWeight.w600),
        unselectedLabelTextStyle: TextStyle(color: ChronosColors.outline, fontSize: 11),
        indicatorColor: Color(0x332563EB),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ChronosColors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: ChronosColors.outlineVariant, width: 0.5),
        ),
        textStyle: ChronosTypography.labelSm.copyWith(color: ChronosColors.onSurface),
      ),
    );
  }
}
