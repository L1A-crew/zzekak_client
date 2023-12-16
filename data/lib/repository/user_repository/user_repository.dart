//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:core/model/identifier/identifier.dart';
import 'package:core/model/representable/representable.dart';
import 'package:core/model/user/user_model.dart';
import 'package:core/repository/user_repository/user_repository.dart';
import 'package:data/infra/mock_shard_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:util/di_env/di_env.dart';

@web
@mobile
@dev
@prod
@Singleton(as: UserRepository)
final class UserRepositoryImpl implements UserRepository {
  @FactoryMethod()
  static Future<UserRepository> create() async {
    await GetIt.instance.getAsync(type: MockSharedPreferences);
    return UserRepositoryImpl();
  }

  @override
  Future<User> findMe() async {
    await Future.delayed(const Duration(seconds: 1));
    return User(Identifier("it's me"), NickName('Mario'));
  }

  @override
  Future<User> findUserByIdentifier(Identifier identifier) {
    throw UnimplementedError();
  }

  @override
  Future<User> save(User user) {
    throw UnimplementedError();
  }
}
