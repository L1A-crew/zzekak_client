//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-07
//

import 'package:core/exception/error_code_book.dart';
import 'package:core/exception/server_io_exception.dart';
import 'package:core/repository/token_provider/token_provider.dart';
import 'package:data/io/http_client.dart';
import 'package:data/io/json_serializable.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthenticationInterceptor extends Interceptor {
  static const String AUHORIZATION = 'Authorization';
  static const String ACCESSTOKEN_KEY = TokenProvider.keyAccessToken;
  static const String REFRESHTOKEN_KEY = TokenProvider.keyRefreshToken;
  final SharedPreferences _sharedPreferences;

  const AuthenticationInterceptor(this._sharedPreferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    String? accessToken = _sharedPreferences.getString(ACCESSTOKEN_KEY);
    if (accessToken == null) {
      return;
    }

    if (options.headers.containsKey(AUHORIZATION)) {
      options.headers.remove(AUHORIZATION);
    }

    options.headers[AUHORIZATION] =
        _sharedPreferences.getString(ACCESSTOKEN_KEY);

    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);

    if (err.response?.data['code'] == IOErrorCode.UNAUTHORIZED) {
      final Dio dio = Dio();
      final String refreshToken =
          _sharedPreferences.getString(REFRESHTOKEN_KEY) ?? '';
      dio.post('http://chunbae-home.iptime.org:6070/user/token/refresh', data: {
        'refreshToken': refreshToken,
      }).then((final Response response) {
        _sharedPreferences.setString(
            ACCESSTOKEN_KEY, response.data['accessToken']);
        _sharedPreferences.setString(
            REFRESHTOKEN_KEY, response.data['refreshToken']);
      });
    }
  }
}

final class DioHttpClientImpl implements HttpClient {
  final String _baseUrl;
  final Dio _dioInstance;

  const DioHttpClientImpl(this._dioInstance, this._baseUrl);

  factory DioHttpClientImpl.create() {
    return DioHttpClientImpl(
        Dio(BaseOptions(
          headers: {
            'Content-Type': 'application/json',
          },
        ))
          ..interceptors.add(AuthenticationInterceptor(
              GetIt.instance.get<SharedPreferences>())),
        'http://chunbae-home.iptime.org:6070');
  }

  @override
  Future<HTTPResponse> get<RequestBody extends ZzekakJsonSerializable>(
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
            errorCode: IOErrorCode.fromStateCode(e.response?.data["code"]),
            trace: s);
      }
      rethrow;
    }
  }

  @override
  Future<HTTPResponse> post<RequestBody extends ZzekakJsonSerializable>(
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
            errorCode: IOErrorCode.fromStateCode(e.response?.data["code"]),
            trace: s);
      }
      rethrow;
    }
  }

  @override
  Future<HTTPResponse> put<RequestBody extends ZzekakJsonSerializable>(
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
            errorCode: IOErrorCode.fromStateCode(e.response?.data["code"]),
            trace: s);
      }
      rethrow;
    }
  }

  @override
  Future<HTTPResponse> delete<RequestBody extends ZzekakJsonSerializable>(
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
            errorCode: IOErrorCode.fromStateCode(e.response?.data["code"]),
            trace: s);
      }
      rethrow;
    }
  }
}

extension _DioHttpResponseExtension on Response {
  HTTPResponse convertToHTTPResponse<T extends ZzekakJsonSerializable>() {
    return HTTPResponse(
      json: data,
      headers: headers.map.map((key, value) => MapEntry(key, value.join(','))),
      statusCode: statusCode,
    );
  }
}
