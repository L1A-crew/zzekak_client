//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-25
//

import 'package:core/exception/error_code_book.dart';
import 'package:core/exception/service_exception.dart';

/// 서버와의 통신 중 발생하는 예외
class ServerIOException extends ServiceException {
  final IOErrorCode errorCode;

  ServerIOException({
    required super.message,
    super.cause,
    required this.errorCode,
    super.trace,
  });

  @override
  String toString() => """$runtimeType {
  message: $message,
  cause: ${cause.runtimeType},
  errorCode: $errorCode,
  trace: $trace
  }""";
}
