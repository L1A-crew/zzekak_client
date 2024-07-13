/*
* "zzekak_client" created by @howyoujini on 2024/07/13  4:46 PM
* Copyright (c) . All rights reserved.
*/
import 'package:flutter/material.dart';

import '../schemes/font_style.dart';

ElevatedButton zzekakElevatedButton({
  required BuildContext context,
  required VoidCallback onPressed,
  required String text,
  Color foregroundColor = Colors.black,
  Color? backgroundColor,
  TextStyle? textStyle,
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 20.0),
  OutlinedBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(13)),
  ),
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      textStyle:
          textStyle ?? ZzekakTextStyle.h4(context, fontWeight: FontWeight.w600),
      padding: padding,
      shape: shape,
    ),
    child: Text(text),
  );
}
