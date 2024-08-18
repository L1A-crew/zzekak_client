import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zzekak/components/app_bar_delete_btn.dart';
import 'package:zzekak/components/elevated_btn.dart';
import 'package:zzekak/schemes/font_style.dart';

class AppointmentSetupView extends StatefulWidget {
  const AppointmentSetupView({required final GetIt di, super.key});

  @override
  State<AppointmentSetupView> createState() => _AppointmentSetupViewState();
}

class _AppointmentSetupViewState extends State<AppointmentSetupView> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: zzekakDeleteAppBar(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('약속을 만들어보세요', style: ZzekakTextStyle.h1(context)),
            zzekakElevatedButton(
                context: context, onPressed: () {}, text: '약속생성하기'),
          ],
        ),
      )),
    );
  }
}
