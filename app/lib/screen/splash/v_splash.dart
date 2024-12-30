import 'package:core/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zzekak/gen/asset_paths.dart';
import 'package:zzekak/module/initialization/initialization_module.dart';
import 'package:zzekak/module/initialization/state_n_event.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @protected
  final InitializationModule module;

  const SplashScreen({
    super.key,
    required this.module,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.module.add(const WhenInitialized());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.onSecondary,
      body: BlocConsumer(
        bloc: widget.module,
        listener: (
          final BuildContext context,
          final AppInitializationState state,
        ) {
          switch (state) {
            case Uninitialized():
              return;
            case Initialized(authInfo: null):
              const LoginRoute().go(context);
            case Initialized(authInfo: final AuthenticationInfo authInfo):
              const HomeRoute().go(context);
          }
        },
        builder: (
          final BuildContext context,
          final AppInitializationState state,
        ) =>
            Center(
          child: SvgPicture.asset(
            AssetPaths.TEXT_LOGO_SVG.path,
            width: 80,
          ),
        ),
      ),
    );
  }
}
