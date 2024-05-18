//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-07
//

import 'package:data/io/json_serializable.dart';

abstract interface class HttpClient {
  static const Map<String, String> DEFAULT_HEADER = {
    'Content-Type': 'application/json',
  };

  Future<HTTPResponse> get<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);

  Future<HTTPResponse> post<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);

  Future<HTTPResponse> put<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);

  Future<HTTPResponse> delete<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request);
}

final class HTTPResponse {
  final Map<String, dynamic>? json;
  final int? statusCode;
  final Map<String, String>? headers;

  const HTTPResponse({
    this.json,
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
