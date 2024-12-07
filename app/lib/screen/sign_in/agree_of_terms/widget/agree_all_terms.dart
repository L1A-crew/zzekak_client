import 'package:flutter/material.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

final class AgreeAllTerms extends StatelessWidget {
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
                fillColor: WidgetStateProperty.all(context.color.tertiary),
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