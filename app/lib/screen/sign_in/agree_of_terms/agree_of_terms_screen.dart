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
                    onDetailTextBtnTap: () {},
                  ),
                  TermsIndicator(
                    title: '[필수] 서비스 이용 약관 동의',
                    isAgreed: state.isAgreeOfServiceTerms,
                    onTap: (value) {
                      widget.viewModel.changeIsAgreeOfServiceTerms(value);
                    },
                    onDetailTextBtnTap: () {},
                  ),
                  TermsIndicator(
                    title: '[필수] 개인정보 처리방침 동의',
                    isAgreed: state.isAgreeOfPrivacyPolicy,
                    onTap: (value) {
                      widget.viewModel.changeIsAgreeOfPrivacyPolicy(value);
                    },
                    onDetailTextBtnTap: () {},
                  ),
                  TermsIndicator(
                    title: '[필수] 마케팅 정보 수신 동의',
                    isAgreed: state.marketingAgreement,
                    onTap: (value) {
                      widget.viewModel.changeMarketingAgreement(value);
                    },
                    onDetailTextBtnTap: () {},
                  ),
                  TermsIndicator(
                    title: '[선택] 위치정보 이용약관 동의',
                    detailText: '약속 장소를 설정하고 도착까지 걸리는 시간을 알려드려요',
                    isAgreed: state.isLocationAgreement,
                    onTap: (value) {
                      widget.viewModel.changeIsLocationAgreement(value);
                    },
                    onDetailTextBtnTap: () {},
                  ),
                  TermsIndicator(
                    title: '[선택] 푸시 알림 수신 동의',
                    detailText: '친구들의 약속 상태를 확인 할 수 있었요',
                    isAgreed: state.isPushAgreement,
                    onTap: (value) {
                      widget.viewModel.changeIsPushAgreement(value);
                    },
                    onDetailTextBtnTap: () {},
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

class AgreeAllTerms extends StatelessWidget {
  final bool isRequiredAgreeOfTerms;
  final void Function(bool value) onTap;

  const AgreeAllTerms({
    required this.isRequiredAgreeOfTerms,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        hoverColor: context.color.tertiaryContainer.withOpacity(0.03),
        onTap: () => onTap(!isRequiredAgreeOfTerms),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Checkbox(
                value: isRequiredAgreeOfTerms,
                onChanged: (value) => onTap(value ?? false),
              ),
              Text(
                "모두 동의합니다.",
                style: ZzekakTextStyle.h4(
                  context,
                  color: context.color.onSurface,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class TermsIndicator extends StatelessWidget {
  final String title;
  final bool shouldShowDetailTextBtn;
  final String detailText;
  final bool isAgreed;
  final void Function(bool isAgreed) onTap;
  final void Function() onDetailTextBtnTap;

  const TermsIndicator({
    super.key,
    required this.title,
    this.shouldShowDetailTextBtn = true,
    this.detailText = '',
    this.isAgreed = false,
    required this.onTap,
    required this.onDetailTextBtnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: InkWell(
        hoverColor: context.color.tertiaryContainer.withOpacity(0.03),
        onTap: () => onTap(!isAgreed),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              // TODO: 자체 디자인 체크박스로 변경
              Checkbox(
                value: isAgreed,
                onChanged: (value) => onTap(value ?? false),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: title,
                        style: ZzekakTextStyle.h5(
                            context, context.color.onSurface, FontWeight.w600),
                      ),
                      if (detailText.isNotEmpty)
                        TextSpan(
                            text: '\n$detailText',
                            style: ZzekakTextStyle.h6(context,
                                    context.color.primary, FontWeight.w900)
                                .copyWith(height: 1.5)),
                    ],
                  ),
                ),
              ),
              // TODO: 문서 링크 달기
              if (shouldShowDetailTextBtn)
                TextButton(
                  onPressed: onDetailTextBtnTap,
                  child: Text(
                    '보기',
                    style: ZzekakTextStyle.h6(
                        context, context.color.tertiaryContainer),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
