//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//
import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/io/dio_http_client_impl.dart';
import 'package:data/io/http_client.dart';
import 'package:get_it/get_it.dart';

GetIt get _di => GetIt.instance;

Future<GetIt> configureDataDependencies() async {
  _di
    ..registerSingleton<HttpClient>(DioHttpClientImpl.create())
    ..registerSingleton<AuthenticationAPI>(
        AuthenticationAPIImpl(_di.get<HttpClient>()));

  await _di.allReady();
  return _di;
}
