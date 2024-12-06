/*
 * "tick_client" created by @howyoujini on 2023/11/11  7:38 PM
 * Copyright (c) app.lib.home. All rights reserved.
 */
import 'package:core/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zzekak/routes/app_routes.dart';

part 'string_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthenticationInfo? user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(_KoKrString.TITLE.text),
          Text(
              "${user?.accessToken.toString() ?? "now loading..."} ${user?.refreshToken.toString()}"),
          TextButton(
            onPressed: () => GoRouter.of(context).go(LoginRoute.PATH),
            child: const Text("로그인 페이지로 이동"),
          ),
          TextButton(
            onPressed: () => GoRouter.of(context).go(CalendarRoute.PATH),
            child: const Text("달력 페이지로 이동"),
          ),
          TextButton(
            onPressed: () => GoRouter.of(context).go(SignedRoute.PATH),
            child: const Text("가입완료 페이지로 이동"),
          ),
          TextButton(
            onPressed: () => const AppointmentSetupRoute().go(context),
            child: const Text("약속생성 하기"),
          ),
          TextButton(
            onPressed: () => GoRouter.of(context).go(AgreeOfTermsRoute.PATH),
            child: const Text("약관동의 페이지로 이동"),
          ),
        ],
      ),
    ));
  }
}
