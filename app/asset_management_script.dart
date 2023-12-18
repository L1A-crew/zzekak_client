//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-18
//

import 'dart:io';

void main() {
  try {
    final Directory scriptLocationDir =
        Directory.fromUri(Platform.script).parent;
    final assetsDirectory = Directory('${scriptLocationDir.path}/assets');
    final genDirectory = Directory('${scriptLocationDir.path}/lib/gen');
    final outputFile = File('${genDirectory.path}/asset_paths.dart');

    // 'gen' 디렉토리가 없는 경우 생성
    if (!genDirectory.existsSync()) {
      genDirectory.createSync();
    }

    // 출력 파일이 이미 존재하는 경우 삭제
    if (outputFile.existsSync()) {
      outputFile.deleteSync();
    }

    // 'assets' 디렉토리 내의 파일들을 탐색
    final files = assetsDirectory.listSync(recursive: true);
    final enumEntries = files.whereType<File>().map((final File file) {
      final String? path = regex.firstMatch(file.path)?.group(0);
      if (path == null) return '';
      return '    ${path.toUpperCase().replaceAll('/', '_').replaceAll('.', '_')} (\'assets/$path\')';
    }).join(',\n');

    final enumString = template(enumEntries);

    // 생성된 enum 문자열을 파일에 쓰기
    outputFile.writeAsStringSync(enumString);
  } catch (e, s) {
    // ignore: avoid_print
    print('Error: $e\nStacktrace: $s');
    exit(1);
  }
  // ignore: avoid_print
  print('에셋 관리 Enum 이 성공적으로 생성되었습니다.');
}

final RegExp regex = RegExp(r'([^/]+)$');

String template(String assets) => """// 자동 생성된 파일입니다. 직접 수정하지 마세요.

enum AssetPaths {
${'$assets;'}
  
  const AssetPaths(this.path);
  final String path;
}
""";
