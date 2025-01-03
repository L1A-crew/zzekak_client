/*
 * "tick_client" created by @howyoujini on 2023/11/11  7:38 PM
 * Copyright (c) app.lib.home. All rights reserved.
 */
import 'package:core/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zzekak/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  final DateTime? selectedDate;
  final DateTime? selectedTime;
  final String? selectedStartLocation;
  final String? selectedEndLocation;
  final String? appointmentName;

  const HomeScreen({
    super.key,
    this.selectedDate,
    this.selectedTime,
    this.selectedStartLocation,
    this.selectedEndLocation,
    this.appointmentName,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthenticationInfo? user;

  DateTime? _selectedDate;
  DateTime? _selectedTime;
  String? _selectedStartLocation;
  String? _selectedEndLocation;
  String? _appointmentName;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.selectedDate;
    _selectedTime = widget.selectedTime;
    _selectedStartLocation = widget.selectedStartLocation;
    _selectedEndLocation = widget.selectedEndLocation;
    _appointmentName = widget.appointmentName;
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
          Text(
              "${user?.accessToken.toString() ?? "now loading..."} ${user?.refreshToken.toString()}"),
          TextButton(
            onPressed: () => const LoginRoute().go(context),
            child: const Text("로그인 페이지로 이동"),
          ),
          TextButton(
            onPressed: () => const SignedRoute().go(context),
            child: const Text("가입완료 페이지로 이동"),
          ),
          TextButton(
            onPressed: () => const AppointmentSetupRoute().go(context),
            child: const Text("약속생성 하기"),
          ),
          TextButton(
            onPressed: () => const AgreeOfTermsRoute().go(context),
            child: const Text("약관동의 페이지로 이동"),
          ),
          TextButton(
            onPressed: () => const NickNameScreenRoute().go(context),
            child: const Text("닉네임 설정 페이지로 이동"),
          ),
          Text(
            '날짜: ${_selectedDate != null ? DateFormat('yyyy.MM.dd').format(_selectedDate!) : 'N/A'}',
          ),
          Text(
            '시간: ${_selectedTime != null ? DateFormat('a HH:mm').format(_selectedTime!) : 'N/A'}',
          ),
          Text('출발지: ${_selectedStartLocation ?? 'N/A'}'),
          Text('도착지: ${_selectedEndLocation ?? 'N/A'}'),
          Text('약속 이름: ${_appointmentName ?? _selectedEndLocation}'),
        ],
      ),
    ));
  }
}
