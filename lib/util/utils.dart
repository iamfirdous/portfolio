import 'package:flutter/material.dart';
import 'package:portfolio/util/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

mixin Utils {
  static bool isMobile(BuildContext context) => ResponsiveBreakpoints.of(context).isMobile;

  static double cardWidth(BuildContext context) {
    return isMobile(context) ? MediaQuery.of(context).size.width - 48.0 : 350.0;
  }
}

class Styles {
  static const regular = [FontVariation('wght', 400.0)];
  static const semiBold = [FontVariation('wght', 600.0)];
  static const bold = [FontVariation('wght', 700.0)];

  static const TextStyle bodySmall = TextStyle(
    color: AppColors.secondary,
    fontFamily: Fonts.fira,
    fontVariations: regular,
    fontSize: 14.0,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.secondary,
    fontFamily: Fonts.fira,
    fontVariations: regular,
    fontSize: 16.0,
    height: 2.24,
    letterSpacing: -0.5,
  );

  static const TextStyle bodyMediumBold = TextStyle(
    color: AppColors.secondary,
    fontFamily: Fonts.fira,
    fontVariations: bold,
    fontSize: 16.0,
    height: 2.24,
    letterSpacing: -0.5,
  );

  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.secondary,
    fontFamily: Fonts.fira,
    fontVariations: regular,
    fontSize: 24.0,
  );

  static const TextStyle labelMedium = TextStyle(
    color: AppColors.secondary,
    fontFamily: Fonts.fira,
    fontSize: 16.0,
    fontVariations: bold,
  );

  static const TextStyle label = TextStyle(
    color: AppColors.primary,
    fontFamily: Fonts.fira,
    fontSize: 20.0,
    fontVariations: bold,
  );

  static const TextStyle headlineSmall = TextStyle(
    color: AppColors.secondary,
    fontFamily: Fonts.fredoka,
    fontVariations: semiBold,
    fontSize: 18.0,
  );

  static const TextStyle headlineMedium = TextStyle(
    color: AppColors.primary,
    fontFamily: Fonts.fredoka,
    fontVariations: bold,
    fontSize: 32.0,
    letterSpacing: 2.0,
  );

  static const TextStyle headlineMedium1 = TextStyle(
    color: AppColors.primary,
    fontFamily: Fonts.fredoka,
    fontVariations: bold,
    fontSize: 24.0,
    letterSpacing: 2.0,
  );

  static const TextStyle headlineMedium2 = TextStyle(
    color: AppColors.primary,
    fontFamily: Fonts.fredoka,
    fontVariations: bold,
    fontSize: 28.0,
    letterSpacing: 2.0,
    height: 1.0,
  );

  static const TextStyle titleMedium = TextStyle(
    color: AppColors.cardColor,
    fontFamily: Fonts.fredoka,
    fontVariations: semiBold,
    fontSize: 20.0,
    letterSpacing: 2.0,
  );
}
