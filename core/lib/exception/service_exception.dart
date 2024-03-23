//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-25
//

/// ZZekak 의 서비스에서 발생하는 예외
class ServiceException implements Exception {
  final String message;
  final Object? cause;
  final StackTrace trace;

  ServiceException({
    required this.message,
    this.cause,
    final StackTrace? trace,
  }) : trace = trace ?? StackTrace.current;

  @override
  String toString() => """$runtimeType {
  message: $message,
  cause: ${cause.runtimeType},
  trace: $trace
  }""";
}
