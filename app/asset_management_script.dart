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
    final Directory scriptLocationDir = Directory.fromUri(Platform.script).parent;
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

    // 재귀적 파일 수집 시작
    final List<File> files = [];
    collectFilesRecursively(assetsDirectory, files);

    // 파일로부터 enum 항목 생성
    final enumEntries = files.map((file) {
      final String? path = regex.firstMatch(file.path)?.group(0);
      if (path == null) return '';
      return '    ${path.toUpperCase().replaceAll('/', '_').replaceAll('.', '_')} (\'assets/$path\')';
    }).join(',\n');

    final enumString = template(enumEntries);

    // 생성된 enum 문자열을 파일에 쓰기
    outputFile.writeAsStringSync(enumString);
  } catch (e, s) {
    print('Error: $e\nStacktrace: $s');
    exit(1);
  }
  print('에셋 관리 Enum 이 성공적으로 생성되었습니다.');
}

// 모든 파일을 재귀적으로 수집하는 메소드
void collectFilesRecursively(Directory dir, List<File> fileList) {
  final List<FileSystemEntity> entities = dir.listSync();
  for (final FileSystemEntity entity in entities) {
    if (entity is Directory) {
      collectFilesRecursively(entity, fileList); // 디렉토리에 대해 재귀 호출
    } else if (entity is File) {
      fileList.add(entity); // 파일 리스트에 추가
    }
  }
}

final RegExp regex = RegExp(r'([^/]+)$');

String template(String assets) => """// 자동 생성된 파일입니다. 직접 수정하지 마세요.

enum AssetPaths {
${'$assets;'}
  
  const AssetPaths(this.path);
  final String path;
}
""";
