//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-07
//

abstract interface class JsonSerializable {
  Map<String, dynamic> toJson();

  JsonSerializable fromJson(Map<String, dynamic> json);
}