/*
* "zzekak_client" created by @howyoujini on 2024/07/13  1:46 PM
* Copyright (c) . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:zzekak/schemes/color_schemes.dart';

/// 유저의 폰트 배율을 조절합니다.
enum _FontSize {
  VERY_SMALL(1.2),
  SMALL(0.95),
  MEDIUM(0.8),
  LARGE(0.65),
  DEFAULT(1.0);

  final double fontFactor;

  const _FontSize(this.fontFactor);
}

@immutable
abstract class ZzekakTextStyle extends TextStyle {
  static double fontFactor(final BuildContext context) {
    final double systemFactor = MediaQuery.of(context).textScaleFactor;

    _FontSize fontSize = _FontSize.DEFAULT;

    final bool systemFontVerySmall = (0 < systemFactor && systemFactor < 1);
    final bool systemFontSmall = (1 <= systemFactor && systemFactor < 1.5);
    final bool systemFontMedium = (1.5 <= systemFactor && systemFactor < 2);
    final bool systemFontLarge = (2 <= systemFactor);

    if (systemFontVerySmall) {
      fontSize = _FontSize.VERY_SMALL;
    } else if (systemFontSmall) {
      fontSize = _FontSize.SMALL;
    } else if (systemFontMedium) {
      fontSize = _FontSize.MEDIUM;
    } else if (systemFontLarge) {
      fontSize = _FontSize.LARGE;
    }
    return fontSize.fontFactor;
  }

  // headline 1
  static TextStyle h1(final BuildContext context,
          [final Color? color, final FontWeight? fontWeight]) =>
      TextStyle(
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: 28 * fontFactor(context),
        height: 1.4,
        letterSpacing: -0.41,
        color: color ?? context.color.onSurface,
      );

  // headline 2
  static TextStyle h2(final BuildContext context,
          [final Color? color, final FontWeight? fontWeight]) =>
      TextStyle(
        fontWeight: fontWeight ?? FontWeight.w700,
        fontSize: 22 * fontFactor(context),
        height: 1.25,
        letterSpacing: -0.41,
        color: color ?? context.color.onSurface,
      );

  // headline 3
  static TextStyle h3(final BuildContext context,
          {final Color? color, final FontWeight? fontWeight}) =>
      TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 18 * fontFactor(context),
        height: 1.2,
        letterSpacing: -0.41,
        color: color ?? context.color.onSurface,
      );

  // headline 4
  static TextStyle h4(final BuildContext context,
          {final Color? color, final FontWeight? fontWeight}) =>
      TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 16 * fontFactor(context),
        height: 1.2,
        letterSpacing: -0.41,
        color: color ?? context.color.onSurface,
      );

  // headline 5
  static TextStyle h5(final BuildContext context,
          [final Color? color, final FontWeight? fontWeight]) =>
      TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 14 * fontFactor(context),
        height: 1.15,
        letterSpacing: -0.41,
        color: color ?? context.color.onSurface,
      );

  // headline 6
  static TextStyle h6(final BuildContext context,
          {final Color? color, final FontWeight? fontWeight}) =>
      TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 13 * fontFactor(context),
        height: 1.24,
        letterSpacing: -0.41,
        color: color ?? context.color.onSurface,
      );
}
