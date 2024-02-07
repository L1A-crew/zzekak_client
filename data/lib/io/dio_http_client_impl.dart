//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-07
//

import 'package:data/io/http_client.dart';
import 'package:data/io/json_serializable.dart';
import 'package:dio/dio.dart';

final class DioHttpClientImpl implements HttpClient {
  final String _baseUrl;
  final Dio _dioInstance;

  const DioHttpClientImpl(this._dioInstance, this._baseUrl);

  @override
  Future<HTTPResponse<ResponseBody>> delete<
      RequestBody extends JsonSerializable,
      ResponseBody extends JsonSerializable>(HTTPRequest<RequestBody> request) {
    return _dioInstance
        .delete(
          '$_baseUrl/${request.url}',
          data: request.body?.toJson(),
          options: Options(
            headers: request.headers,
          ),
        )
        .then((final Response response) =>
            response.convertToHTTPResponse<ResponseBody>());
  }

  @override
  Future<HTTPResponse<ResponseBody>> get<RequestBody extends JsonSerializable,
          ResponseBody extends JsonSerializable>(
      HTTPRequest<RequestBody> request) async {
    return _dioInstance
        .get(
          '$_baseUrl/${request.url}',
          options: Options(
            headers: request.headers,
          ),
          data: request.body?.toJson(),
        )
        .then((final Response response) =>
            response.convertToHTTPResponse<ResponseBody>());
  }

  @override
  Future<HTTPResponse<ResponseBody>> post<RequestBody extends JsonSerializable,
          ResponseBody extends JsonSerializable>(
      HTTPRequest<RequestBody> request) async {
    return _dioInstance
        .post(
          '$_baseUrl/${request.url}',
          options: Options(
            headers: request.headers,
          ),
          data: request.body?.toJson(),
        )
        .then((final Response response) =>
            response.convertToHTTPResponse<ResponseBody>());
  }

  @override
  Future<HTTPResponse<ResponseBody>> put<RequestBody extends JsonSerializable,
      ResponseBody extends JsonSerializable>(HTTPRequest<RequestBody> request) {
    return _dioInstance
        .put(
          '$_baseUrl/${request.url}',
          options: Options(
            headers: request.headers,
          ),
          data: request.body?.toJson(),
        )
        .then((final Response response) =>
            response.convertToHTTPResponse<ResponseBody>());
  }
}

extension _DioHttpResponseExtension on Response {
  HTTPResponse<T> convertToHTTPResponse<T extends JsonSerializable>() {
    return HTTPResponse<T>(
      data: data,
      headers: headers.map.map((key, value) => MapEntry(key, value.join(','))),
      statusCode: statusCode,
    );
  }
}
