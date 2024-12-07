import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zzekak/common_widget/checker.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

final class TermsIndicator extends StatelessWidget {
  final String title;
  final String fullTermsLink;
  final bool shouldShowDetailTextBtn;
  final String detailText;
  final bool isAgreed;
  final void Function(bool isAgreed) onTap;

  const TermsIndicator({
    super.key,
    required this.title,
    required this.fullTermsLink,
    this.shouldShowDetailTextBtn = true,
    this.detailText = '',
    this.isAgreed = false,
    required this.onTap,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checker(
                value: isAgreed,
                onChanged: onTap,
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
              if (shouldShowDetailTextBtn)
                TextButton(
                  onPressed: () => launchUrl(Uri.parse(fullTermsLink)),
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
