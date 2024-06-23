//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-07
//

abstract interface class ZzekakJsonSerializable {
  Map<String, dynamic> toJson();

  ZzekakJsonSerializable fromJson(Map<String, dynamic> json);
}