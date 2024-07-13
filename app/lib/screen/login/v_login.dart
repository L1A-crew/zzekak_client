//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-04-13
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:zzekak/gen/asset_paths.dart';
import 'package:zzekak/mixin/login.dart';
import 'package:zzekak/schemes/color_schemes.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Column(children: [
              CircleAvatar(
                  backgroundColor: context.color.primary,
                  radius: 36.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(AssetPaths.TEXT_LOGO_SVG.path,
                          color: Colors.black),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text('아껴주세요', style: ZzekakTextStyle.h1(context)),
                    Text('시간을', style: ZzekakTextStyle.h1(context)),
                    Text('친구를', style: ZzekakTextStyle.h1(context)),
                  ],
                ),
              ),
              const Text("효율적인 시간 관리,\n째깍과 함께 시작해보세요!",
                  textAlign: TextAlign.center),
            ]),
            Expanded(child: Container()),
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final res =
                        await _viewModel.whenLoginBtnTapped(KakaoLoginEvent());
                    if (kDebugMode) {
                      print(res);
                    }
                  },
                  child: SvgPicture.asset(AssetPaths.KAKAO_LOGIN_SVG.path),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                GestureDetector(
                  onTap: () async {
                    final res =
                        await _viewModel.whenLoginBtnTapped(AppleLoginEvent());
                    if (kDebugMode) {
                      print(res);
                    }
                  },
                  child: SvgPicture.asset(AssetPaths.APPLE_LOGIN_SVG.path),
                ),
                const Padding(padding: EdgeInsets.all(12.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
