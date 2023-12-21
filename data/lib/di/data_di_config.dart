//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data_di_config.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDataDependencies() async {
  getIt = getIt.init(environment: Environment.dev);

  await getIt.allReady();
  return getIt;
}
