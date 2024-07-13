//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:data/di/data_di_config.dart';
import 'package:get_it/get_it.dart';

Future<GetIt> resolveDependency() async {
  GetIt getIt = await configureDataDependencies();
  // register other dependencies here
  await getIt.allReady();

  return getIt;
}
