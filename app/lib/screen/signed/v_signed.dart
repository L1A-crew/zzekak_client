import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:zzekak/components/elevated_btn.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

class SignedScreen extends StatefulWidget {
  const SignedScreen({required final GetIt di, super.key});

  @override
  State<SignedScreen> createState() => _SignedScreenState();
}

class _SignedScreenState extends State<SignedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '환영해요!\n이제 째깍이와 함께\n약속을 만들어볼까요?\n',
                        style: ZzekakTextStyle.h1(context)),
                    TextSpan(
                        text: '디스크립션 작성 1줄까지만 작성하기 텍스트 너무 많음!',
                        style: ZzekakTextStyle.h4(context)),
                  ],
                ),
              ),
            ),
            Expanded(child: Container(color: context.color.onTertiary)),
            const Padding(padding: EdgeInsets.all(10.0)),
            zzekakElevatedButton(
                context: context,
                onPressed: () {
                  print('약속 생성하기!!');
                },
                text: '약속 생성하기'),
            TextButton(
              onPressed: () => CalendarRoute().go(context),
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent)),
              child: Text('둘러보기',
                  style: ZzekakTextStyle.h4(context,
                      color: context.color.onSecondaryContainer)),
            ),
          ],
        ),
      )),
    );
  }
}
