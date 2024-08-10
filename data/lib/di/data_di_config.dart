//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//
import 'package:core/repository/token_provider/token_provider.dart';
import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/io/dio_http_client_impl.dart';
import 'package:data/io/http_client.dart';
import 'package:data/repository/user_repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<GetIt> configureDataDependencies({required final GetIt di}) async {
  di
    ..registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance())
    ..registerSingleton<HttpClient>(DioHttpClientImpl.create())
    ..registerSingleton<AuthenticationAPI>(
        AuthenticationAPIImpl(di.get<HttpClient>()))
    ..registerSingleton<TokenProvider>(TokenProviderImpl(
      authenticationAPI: di.get<AuthenticationAPI>(),
      searchPreferences: di.get<SharedPreferences>(),
    ));
  return di;
}
