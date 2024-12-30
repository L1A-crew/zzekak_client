//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-04-13
//

import 'dart:io';

import 'package:core/model/user/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:zzekak/gen/asset_paths.dart';
import 'package:zzekak/mixin/login.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/font_style.dart';
import 'package:zzekak/screen/login/vm_login.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _viewModel;

  LoginScreen({
    required final GetIt di,
    super.key,
  }) : _viewModel = LoginViewModel(getIt: di);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginViewModel, LoginViewState>(
          bloc: _viewModel,
          listener: (final BuildContext context, final LoginViewState state) {
            switch (state) {
              case LoginViewState(
                  authenticationInfo: AuthenticationInfo(),
                  isFirstLogin: true
                ):
                const SignedRoute().go(context);
            }
            switch (state) {
              case LoginViewState(
                  authenticationInfo: AuthenticationInfo(),
                  isFirstLogin: false
                ):
                const HomeRoute().go(context);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Column(children: [
                SvgPicture.asset(
                  AssetPaths.BLACK_AND_WHITE_SVG.path,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text('아껴주세요', style: ZzekakTextStyle.h1(context)),
                      Text('시간을', style: ZzekakTextStyle.h1(context)),
                      Text('친구를', style: ZzekakTextStyle.h1(context)),
                    ],
                  ),
                ),
                Text("효율적인 시간 관리,\n째깍과 함께 시작해보세요!",
                    textAlign: TextAlign.center,
                    style: ZzekakTextStyle.h4(context)),
              ]),
              Expanded(child: Container()),
              Column(
                children: [
                  GestureDetector(
                    onTap: () =>
                        _viewModel.whenLoginBtnTapped(KakaoLoginEvent()),
                    child: SvgPicture.asset(AssetPaths.KAKAO_LOGIN_SVG.path),
                  ),
                  const Padding(padding: EdgeInsets.all(7.0)),
                  Visibility(
                    visible: !kIsWeb && Platform.isIOS,
                    child: GestureDetector(
                      onTap: () =>
                          _viewModel.whenLoginBtnTapped(AppleLoginEvent()),
                      child: SvgPicture.asset(AssetPaths.APPLE_LOGIN_SVG.path),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(12.0)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
