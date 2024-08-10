//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:data/di/data_di_config.dart';
import 'package:get_it/get_it.dart';
import 'package:zzekak/di/app_di_config.dart';

Future<GetIt> resolveDependency() async => await GetIt.instance
        .let((it) async => await configureDataDependencies(di: it))
        .then((it) async => await configureAppDependencies(di: it))
        .then((it) async {
      await it.allReady();
      return it;
    });
