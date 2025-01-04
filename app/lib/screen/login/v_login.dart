//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-04-13
//

import 'dart:io';

import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:zzekak/components/elevated_btn.dart';
import 'package:zzekak/gen/asset_paths.dart';
import 'package:zzekak/mixin/login.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/font_style.dart';
import 'package:zzekak/screen/login/vm_login.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel _viewModel;

  LoginScreen({
    required final GetIt di,
    super.key,
  }) :
        _viewModel = LoginViewModel.newInstance();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginViewModel, LoginViewState>(
          bloc: widget._viewModel
            ..also((it) => Logger().i("blocHash: ${it.hashCode}")),
          listener: (final BuildContext context, final LoginViewState state) {
            switch (state) {
              case LoginViewState(isFirstLogin: true):
                const AgreeOfTermsRoute().go(context);

              case LoginViewState(isFirstLogin: false):
                const AgreeOfTermsRoute().go(context);
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: () => const SignedRoute().go(context),
                    child: const Text("가입완료 페이지로 이동"),
                  ),
                  TextButton(
                    onPressed: () => const AgreeOfTermsRoute().go(context),
                    child: const Text("약관동의 페이지로 이동"),
                  ),
                  TextButton(
                    onPressed: () => const NickNameScreenRoute().go(context),
                    child: const Text("닉네임 설정 페이지로 이동"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: zzekakElevatedButton(
                        context: context,
                        onPressed: () =>
                            const AppointmentSetupRoute().go(context),
                        text: '약속 생성하기'),
                  ),
                  const Padding(padding: EdgeInsets.all(7.0)),
                  GestureDetector(
                    onTap: () => widget._viewModel
                        .whenLoginBtnTapped(KakaoLoginEvent())
                      ..also((it) => Logger().i("blocHash: ${it.hashCode}")),
                    child: SvgPicture.asset(AssetPaths.KAKAO_LOGIN_SVG.path),
                  ),
                  const Padding(padding: EdgeInsets.all(7.0)),
                  Visibility(
                    visible: !kIsWeb && Platform.isIOS,
                    child: GestureDetector(
                      onTap: () => widget._viewModel
                        ..also((it) => Logger().i("blocHash: ${it.hashCode}"))
                            .whenLoginBtnTapped(AppleLoginEvent()),
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
