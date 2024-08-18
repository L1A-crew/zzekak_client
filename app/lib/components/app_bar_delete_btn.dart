import 'package:flutter/material.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/color_schemes.dart';

AppBar zzekakDeleteAppBar(final BuildContext context,
    [final VoidCallback? callback]) {
  return AppBar(
    foregroundColor: context.color.onBackground,
    backgroundColor: context.color.background,
    actions: [
      IconButton(
          onPressed: callback ?? () => const HomeRoute().go(context),
          icon: const Padding(
              padding: EdgeInsets.only(right: 12.0), child: Icon(Icons.close))),
    ],
  );
}
