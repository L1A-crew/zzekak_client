//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:core/model/identifier/identifier.dart';
import 'package:core/model/user/user_model.dart';

abstract interface class UserRepository {
  /// [identifier] 에 해당하는 [User] 를 반환합니다.
  Future<User> findUserByIdentifier(Identifier identifier);

  /// 현재 로그인한 [User] 를 반환합니다.
  Future<User> findMe();

  /// [user] 를 저장소에 저장합니다.
  Future<User> save(User user);
}
