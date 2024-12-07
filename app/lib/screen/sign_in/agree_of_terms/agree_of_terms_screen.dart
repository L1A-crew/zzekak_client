//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-18
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/view_model/state.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/view_model/view_model_agree_of_terms.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/widget/agree_all_terms.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/widget/terms_indicator.dart';

class AgreeOfTermsScreen extends StatefulWidget {
  final ViewModelOfAgreeOfTerms viewModel =
      ViewModelOfAgreeOfTerms(const AgreeOfTermsState());

  AgreeOfTermsScreen({super.key});

  @override
  State<AgreeOfTermsScreen> createState() => _AgreeOfTermsScreenState();
}

class _AgreeOfTermsScreenState extends State<AgreeOfTermsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.viewModel,
      builder: (
        final BuildContext context,
        final AgreeOfTermsState state,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 39.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "원활한 서비스 이용을 위해\n약관동의가 필요해요",
                    style: ZzekakTextStyle.h1(context),
                    textAlign: TextAlign.left,
                  ),
                  AgreeAllTerms(
                    isRequiredAgreeOfTerms: state.isRequiredAgreeOfTerms,
                    onTap: (value) {
                      widget.viewModel.changeAllAgreeOfTerms(value);
                    },
                  ),
                  TermsIndicator(
                    title: '[필수] 만 14세 이상입니다',
                    isAgreed: state.isOverFourteen,
                    onTap: (value) {
                      widget.viewModel.changeIsOverFourteen(value);
                    },
                    fullTermsLink: 'https://www.naver.com',
                  ),
                  TermsIndicator(
                    title: '[필수] 서비스 이용 약관 동의',
                    isAgreed: state.isAgreeOfServiceTerms,
                    onTap: (value) {
                      widget.viewModel.changeIsAgreeOfServiceTerms(value);
                    },
                    fullTermsLink: 'https://www.naver.com',
                  ),
                  TermsIndicator(
                    title: '[필수] 개인정보 처리방침 동의',
                    isAgreed: state.isAgreeOfPrivacyPolicy,
                    onTap: (value) {
                      widget.viewModel.changeIsAgreeOfPrivacyPolicy(value);
                    },
                    fullTermsLink: 'https://www.naver.com',
                  ),
                  TermsIndicator(
                    title: '[필수] 마케팅 정보 수신 동의',
                    isAgreed: state.marketingAgreement,
                    onTap: (value) {
                      widget.viewModel.changeMarketingAgreement(value);
                    },
                    fullTermsLink: 'https://www.naver.com',
                  ),
                  TermsIndicator(
                    title: '[선택] 위치정보 이용약관 동의',
                    detailText: '약속 장소를 설정하고 도착까지 걸리는 시간을 알려드려요',
                    isAgreed: state.isLocationAgreement,
                    onTap: (value) {
                      widget.viewModel.changeIsLocationAgreement(value);
                    },
                    fullTermsLink: 'https://www.naver.com',
                  ),
                  TermsIndicator(
                    title: '[선택] 푸시 알림 수신 동의',
                    detailText: '친구들의 약속 상태를 확인 할 수 있었요',
                    isAgreed: state.isPushAgreement,
                    onTap: (value) {
                      widget.viewModel.changeIsPushAgreement(value);
                    },
                    fullTermsLink: 'https://www.naver.com',
                  ),

                  const Expanded(child: SizedBox.shrink()),
                  // TODO: 버튼 나타 날 때 애니메이션 추가
                  if (state.isRequiredAgreeOfTerms)
                    // TODO: BTN 디자인 변경 (BorderRadius)
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(
                        width: double.infinity,
                        height: 60.0,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: 다음 페이지로 이동 로직 추가
                        },
                        child: Text(
                          '다음',
                          style: ZzekakTextStyle.h5(
                            context,
                            context.color.tertiaryContainer,
                            FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
