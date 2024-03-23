//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//
import 'package:get_it/get_it.dart';

GetIt get _di => GetIt.instance;

Future<GetIt> configureDataDependencies() async {
  await _di.allReady();
  return _di;
}
