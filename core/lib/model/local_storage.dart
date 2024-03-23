//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-24
//

/// String key-value 형태의 데이터를 저장하는 간단한 로컬 저장소
abstract interface class LocalStorage {
  Future<void> save(String key, String value);

  Future<String> read(String key);

  Future<void> delete(String key);
}
