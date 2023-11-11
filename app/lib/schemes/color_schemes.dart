/*
 * "senior_client" created by @howyoujini on 2023/11/03  5:53 PM
 * Copyright (c) . All rights reserved.
 */
import 'package:flutter/material.dart';

extension ColorSchemeOnContextExtension on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffff604b),
  onPrimary: Color(0xffFAFAFA),
  primaryContainer: Color(0xFF777777),
  onPrimaryContainer: Color(0xFFFFFBAC),
  secondary: Color(0xffffc14a),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD3D3D3),
  onSecondaryContainer: Color(0xFF868686),
  tertiary: Color(0xffdddddd),
  onTertiary: Color(0xFFF1F3F6),
  tertiaryContainer: Color(0xFFB4B4B4),
  onTertiaryContainer: Color(0xFF696969),
  error: Color(0xFFE92121),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF8D1010),
  background: Color(0xFFE4E7ED),
  onBackground: Color(0xFF0C0C0C),
  surface: Color(0xFFEBEEF2),
  onSurface: Color(0xFF181818),
  surfaceVariant: Color(0xFFF4DED3),
  onSurfaceVariant: Color(0xFFD9D9D9),
  outline: Color(0xFFEFEFEF),
  onInverseSurface: Color(0xFFE5E5E5),
  inverseSurface: Color(0xFF00363D),
  inversePrimary: Color(0xFF52E797),
  shadow: Color(0x1A000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffff604b),
  onPrimary: Color(0xFF515151),
  primaryContainer: Color(0xFFF1F1F1),
  onPrimaryContainer: Color(0xFFFFFBAC),
  secondary: Color(0xffffd88b),
  onSecondary: Color(0xFF2D2D2D),
  secondaryContainer: Color(0xFFD3D3D3),
  onSecondaryContainer: Color(0xFF868686),
  tertiary: Color(0xffdddddd),
  onTertiary: Color(0xFF525252),
  tertiaryContainer: Color(0x26FFFFFF),
  onTertiaryContainer: Color(0xFFECECEC),
  error: Color(0xFFE92121),
  errorContainer: Color(0xFFFF989F),
  onError: Color(0xFFAB1010),
  background: Color(0xFF1C1B1B),
  onBackground: Color(0xFFFFFFFF),
  surface: Color(0xFF0A0A0A),
  onSurface: Color(0xF3F3F3F3),
  surfaceVariant: Color(0xFF52443C),
  onSurfaceVariant: Color(0xFF8D8D8D),
  outline: Color(0xFF1C1C1C),
  onInverseSurface: Color(0xFF181818),
  inverseSurface: Color(0xFFE5E5E5),
  inversePrimary: Color(0xFF52E797),
  shadow: Color(0x66000000),
);
