//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-18
//

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _DoNotUseStringDirectlyInImgWidgetLinter();

final class _DoNotUseStringDirectlyInImgWidgetLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        DoNotUseStringDirectlyInImgWidgetLintCode(),
      ];
}

final class DoNotUseStringDirectlyInImgWidgetLintCode extends DartLintRule {
  DoNotUseStringDirectlyInImgWidgetLintCode() : super(code: _code);

  static const LintCode _code = LintCode(
    name: 'do_not_use_string_directly_in_img_widget',
    problemMessage: 'Codegen 된 AssetPaths enum 을 사용하세요.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry
        .addInstanceCreationExpression((final InstanceCreationExpression node) {
      bool isSvgPicture =
          node.staticType?.getDisplayString(withNullability: false) ==
              'SvgPicture';
      bool isImage =
          node.staticType?.getDisplayString(withNullability: false) == 'Image';
      bool isAsset = node.constructorName.name?.name.contains('asset') ?? false;
      if ((isSvgPicture || isImage) && isAsset) {
        final bool isAssetPathContains = node.argumentList.arguments
            .map((final Expression e) => e.beginToken.lexeme)
            .contains("AssetPaths");
        if (!isAssetPathContains) {
          reporter.reportErrorForNode(_code, node);
        }
      }
    });
  }
}
