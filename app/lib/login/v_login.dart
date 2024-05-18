//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-04-13
//

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zzekak/gen/asset_paths.dart';
import 'package:zzekak/login/vm_login.dart';

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
          children: [
            const Expanded(
              flex: 10,
              child: Placeholder(),
            ),
            GestureDetector(
              onTap: () async {
                final res = await _viewModel.login();
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder: (_) => Text(
                      res.toString(),
                    ),
                  );
                }
              },
              child: Image.asset(AssetPaths.KAKAO_LOGIN_PNG.path),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
