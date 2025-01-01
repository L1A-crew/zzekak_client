/*
* "zzekak_client" created by @howyoujini on 2024/11/03  1:26 PM
* Copyright (c) . All rights reserved.
*/
import 'package:flutter/material.dart';

extension ColorSchemeOnContextExtension on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff92fd4b),
  onPrimary: Color(0xffFAFAFA),
  primaryContainer: Color(0xFF777777),
  onPrimaryContainer: Color(0xFFFFFBAC),
  secondary: Color(0xffffc14a),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD3D3D3),
  onSecondaryContainer: Color(0xFF868686),
  tertiary: Color(0xffdddddd),
  onTertiary: Color(0xFFF1F3F6),
  tertiaryContainer: Color(0xff999999),
  onTertiaryContainer: Color(0xFF696969),
  error: Color(0xFFFF1818),
  errorContainer: Color(0xFFFFE4E4),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF8D1010),
  surface: Color.fromARGB(255, 255, 255, 255),
  onSurface: Color(0xFF181818),
  onSurfaceVariant: Color(0xffF1F3F5),
  outline: Color(0xFFEFEFEF),
  onInverseSurface: Color(0xFFE5E5E5),
  inverseSurface: Color(0xFF00363D),
  inversePrimary: Color(0xFF52E797),
  shadow: Color(0x1A000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff92fd4b),
  onPrimary: Color(0xFF515151),
  primaryContainer: Color(0xFFF1F1F1),
  onPrimaryContainer: Color(0xFFFFFBAC),
  secondary: Color(0xffffd88b),
  onSecondary: Color(0xFF2D2D2D),
  secondaryContainer: Color(0xFFD3D3D3),
  onSecondaryContainer: Color(0xFF868686),
  tertiary: Color(0xffdddddd),
  onTertiary: Color(0xFF525252),
  tertiaryContainer: Color(0xFFB8B8B8),
  onTertiaryContainer: Color(0xFFECECEC),
  error: Color(0xFFFF1818),
  errorContainer: Color(0xFFFFE4E4),
  onError: Color(0xFFAB1010),
  surface: Color.fromARGB(255, 24, 24, 24),
  onSurface: Color(0xF3F3F3F3),
  onSurfaceVariant: Color.fromARGB(255, 43, 43, 44),
  outline: Color(0xFF1C1C1C),
  onInverseSurface: Color(0xFF181818),
  inverseSurface: Color(0xFFE5E5E5),
  inversePrimary: Color(0xFF52E797),
  shadow: Color(0x66000000),
);
