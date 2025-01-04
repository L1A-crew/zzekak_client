import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zzekak/components/elevated_btn.dart';
import 'package:zzekak/routes/app_routes.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _textCtr;
  late WidgetStatesController _btnStateCtr;

  @override
  void initState() {
    super.initState();
    _textCtr = TextEditingController();
    _btnStateCtr = WidgetStatesController()..update(WidgetState.disabled, true);
    _textCtr.addListener(() {
      if (_textCtr.text.isNotEmpty) {
        _btnStateCtr.update(
            WidgetState.disabled, _formKey.currentState?.validate() ?? true);
      }
    });
    _btnStateCtr.addListener(() => print(_btnStateCtr.value));
  }

  @override
  void dispose() {
    super.dispose();
    _textCtr.dispose();
    _btnStateCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  "사용하실 닉네임을\n입력해주세요",
                  style: ZzekakTextStyle.h1(context),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _textCtr,
                    maxLength: 8,
                    decoration: InputDecoration(
                      hintText: "한글 영문 숫자를 사용 할 수 있어요",
                      hintStyle: ZzekakTextStyle.h5(context),
                      filled: true,
                      fillColor: context.color.tertiary.withOpacity(0.5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    validator: (final String? input) {
                      return switch (input) {
                        null => '닉네임을 입력해주세요.',
                        String(isEmpty: final isEmpty) when isEmpty =>
                          "닉네임을 입력해주세요.",
                        String(length: final length) when length < 2 =>
                          "2글자 이상 입력해주세요.",
                        String(length: final length) when length > 9 =>
                          "8글자 이하로 입력해주세요",
                        String input when RegExp(r'\s').hasMatch(input) =>
                          "띄어쓰기는 사용 할 수 없어요.",
                        //    정규식: ^[가-힣a-zA-Z0-9]+$
                        //    - 문자열이 시작(^)해서 끝($)날 때까지
                        //    - 한글(가-힣), 영어(a-zA-Z), 숫자(0-9)만 존재하는지 검사
                        String s
                            when !RegExp(r'^[가-힣a-zA-Z0-9]+$').hasMatch(s) =>
                          "특수문자는 사용할 수 없어요.",
                        _ => null,
                      };
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: zzekakElevatedButton(
          context: context,
          onPressed: () {
            if (_textCtr.text.isEmpty ||
                !(_formKey.currentState?.validate() ?? false)) {
              Fluttertoast.showToast(msg: '올바른 닉네임을 입력해주세요.');

              return;
            }

            const HomeRoute().go(context);
          },
          text: "다음",
          textStyle: ZzekakTextStyle.h5(context, Colors.black),
        ),
      ),
    );
  }
}
