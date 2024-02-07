//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-07
//

import 'package:data/io/json_serializable.dart';

abstract interface class HttpClient {
  static const DEFAULT_HEADER = {
    'Content-Type': 'application/json',
  };

  Future<HTTPResponse<ResponseBody>> get<RequestBody extends JsonSerializable,
          ResponseBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);

  Future<HTTPResponse<ResponseBody>> post<RequestBody extends JsonSerializable,
          ResponseBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);

  Future<HTTPResponse<ResponseBody>> put<RequestBody extends JsonSerializable,
          ResponseBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);

  Future<HTTPResponse<ResponseBody>> delete<
          RequestBody extends JsonSerializable,
          ResponseBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);
}

final class HTTPResponse<T extends JsonSerializable> {
  final T? data;
  final int? statusCode;
  final Map<String, String>? headers;

  const HTTPResponse({
    this.data,
    this.headers,
    this.statusCode,
  });
}

final class HTTPRequest<T extends JsonSerializable> {
  final String url;
  final Map<String, String> headers;
  final T? body;

  HTTPRequest({
    required this.url,
    final Map<String, String>? headers,
    this.body,
  }) : headers = {
          ...HttpClient.DEFAULT_HEADER,
          ...?headers,
        };
}
