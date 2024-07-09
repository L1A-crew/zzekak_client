//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-25
//

enum IOErrorCode {
  UNAUTHORIZED("U-001"),
  NOT_FOUND_USER("U-002"),
  FORBIDDEN("UNDEF"),
  NOT_FOUND("UNDEF"),
  REQUEST_TIMEOUT("UNDEF"),
  UPDATE_REQUIRED("UNDEF"),
  MALFORMED_REQUEST("UNDEF"),
  INTERNAL_SERVER_ERROR("UNDEF"),
  UNKNOWN("UNDEF");

  final String stateCode;

  const IOErrorCode(this.stateCode);

  static IOErrorCode fromStateCode(String? stateCode) {
    switch (stateCode) {
      case "U-001":
        return UNAUTHORIZED;
      case "U-002":
        return NOT_FOUND_USER;
      default:
        return UNKNOWN;
    }
  }
}
