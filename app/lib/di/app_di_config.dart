//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:data/di/data_di_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_di_config.config.dart';

@InjectableInit()
Future<GetIt> resolveDependency() async {
  GetIt getIt = await configureDataDependencies();
  getIt = getIt.init();
  // 이부분 스플래쉬로 옮겨갈 로직입니다.
  await getIt.allReady();

  return getIt;
}
