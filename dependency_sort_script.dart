//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-03-01
//

import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

//pre-commit-hook

Future<void> main(final List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart dependency_sort_script.dart <file_path>');
    return;
  }

  final file = File(args[0]);

  if (!await file.exists()) {
    print('File not found: ${args[0]}');
    return;
  }

  final contents = await file.readAsString();
  final docs = loadYamlDocument(contents);
  final editor = YamlEditor(contents);

  void sortDependencies(final String key) {
    if (docs.contents.value[key] != null) {
      final deps = Map.from(docs.contents.value[key] as Map);
      final sortedKeys = deps.keys.toList()..sort();

      for (var k in sortedKeys) {
        editor.remove([key, k]);
        editor.update([key, k], deps[k]);
      }
    }
  }

  sortDependencies('dependencies');
  sortDependencies('dev_dependencies');

  await file.writeAsString(editor.toString());
  print('Sorted dependencies in ${args[0]}');
}
