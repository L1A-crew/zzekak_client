//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-10
//

import 'package:get_it/get_it.dart';
import 'package:zzekak/module/initialization/initialization_module.dart';

Future<GetIt> configureAppDependencies({
  required final GetIt di,
}) async {
  di.registerSingleton(InitializationModule.newInstance());
  return di;
}
