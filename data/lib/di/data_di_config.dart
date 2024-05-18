//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//
import 'package:core/repository/user_repository/user_repository.dart';
import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/io/dio_http_client_impl.dart';
import 'package:data/io/http_client.dart';
import 'package:data/repository/user_repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt get _di => GetIt.instance;

Future<GetIt> configureDataDependencies() async {
  _di
    ..registerSingleton<HttpClient>(DioHttpClientImpl.create())
    ..registerSingleton<AuthenticationAPI>(
        AuthenticationAPIImpl(_di.get<HttpClient>()))
    ..registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance())
    ..registerSingleton<TokenProvider>(TokenProviderImpl(
      authenticationAPI: _di.get<AuthenticationAPI>(),
      searchPreferences: _di.get<SharedPreferences>(),
    ));
  return _di;
}
