//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-07
//

import 'package:core/exception/error_code_book.dart';
import 'package:core/exception/server_io_exception.dart';
import 'package:data/io/http_client.dart';
import 'package:data/io/json_serializable.dart';
import 'package:dio/dio.dart';

final class DioHttpClientImpl implements HttpClient {
  final String _baseUrl;
  final Dio _dioInstance;

  const DioHttpClientImpl(this._dioInstance, this._baseUrl);

  factory DioHttpClientImpl.create() {
    return DioHttpClientImpl(Dio(), 'http://chunbae-home.iptime.org:6070');
  }

  @override
  Future<HTTPResponse> get<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request) async {
    try {
      return _dioInstance
          .get(
            '$_baseUrl/${request.url}',
            options: Options(
              headers: request.headers,
            ),
            data: request.body?.toJson(),
          )
          .then((final Response response) => response.convertToHTTPResponse());
    } catch (e, s) {
      if (e is DioException) {
        throw ServerIOException(
            message: e.message ?? 'Unknown error',
            errorCode: IOErrorCode.fromStateCode(e.response?.statusCode ?? 0),
            trace: s);
      }
      rethrow;
    }
  }

  @override
  Future<HTTPResponse> post<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request) async {
    try {
      return _dioInstance
          .post(
            '$_baseUrl/${request.url}',
            options: Options(
              headers: request.headers,
            ),
            data: request.body?.toJson(),
          )
          .then((final Response response) => response.convertToHTTPResponse());
    } catch (e, s) {
      if (e is DioException) {
        throw ServerIOException(
            message: e.message ?? 'Unknown error',
            errorCode: IOErrorCode.fromStateCode(e.response?.statusCode ?? 0),
            trace: s);
      }
      rethrow;
    }
  }

  @override
  Future<HTTPResponse> put<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request) {
    try {
      return _dioInstance
          .put(
            '$_baseUrl/${request.url}',
            options: Options(
              headers: request.headers,
            ),
            data: request.body?.toJson(),
          )
          .then((final Response response) => response.convertToHTTPResponse());
    } catch (e, s) {
      if (e is DioException) {
        throw ServerIOException(
            message: e.message ?? 'Unknown error',
            errorCode: IOErrorCode.fromStateCode(e.response?.statusCode ?? 0),
            trace: s);
      }
      rethrow;
    }
  }

  @override
  Future<HTTPResponse> delete<RequestBody extends JsonSerializable>(
      final HTTPRequest<RequestBody> request) {
    try {
      return _dioInstance
          .delete(
            '$_baseUrl/${request.url}',
            data: request.body?.toJson(),
            options: Options(
              headers: request.headers,
            ),
          )
          .then((final Response response) => response.convertToHTTPResponse());
    } catch (e, s) {
      if (e is DioException) {
        throw ServerIOException(
            message: e.message ?? 'Unknown error',
            errorCode: IOErrorCode.fromStateCode(e.response?.statusCode ?? 0),
            trace: s);
      }
      rethrow;
    }
  }
}

extension _DioHttpResponseExtension on Response {
  HTTPResponse convertToHTTPResponse<T extends JsonSerializable>() {
    return HTTPResponse(
      json: data,
      headers: headers.map.map((key, value) => MapEntry(key, value.join(','))),
      statusCode: statusCode,
    );
  }
}
