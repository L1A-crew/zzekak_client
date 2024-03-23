//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-25
//

enum IOErrorCode {
  UNAUTHORIZED(401),
  FORBIDDEN(403),
  NOT_FOUND(404),
  REQUEST_TIMEOUT(408),
  UPDATE_REQUIRED(426),
  MALFORMED_REQUEST(422),
  INTERNAL_SERVER_ERROR(500),
  UNKNOWN(0);

  final int stateCode;

  const IOErrorCode(this.stateCode);

  static IOErrorCode fromStateCode(int stateCode) {
    switch (stateCode) {
      case 401:
        return UNAUTHORIZED;
      case 403:
        return FORBIDDEN;
      case 404:
        return NOT_FOUND;
      case 408:
        return REQUEST_TIMEOUT;
      case 422:
        return MALFORMED_REQUEST;
      case 426:
        return UPDATE_REQUIRED;
      case 500:
        return INTERNAL_SERVER_ERROR;
      default:
        return UNKNOWN;
    }
  }
}
