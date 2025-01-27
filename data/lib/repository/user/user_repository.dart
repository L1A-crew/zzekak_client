import 'package:core/model/user/user_model.dart';
import 'package:core/repository/user/user_repository.dart';
import 'package:data/api/auth_api/user_api.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserAPI _userAPI;

  const UserRepositoryImpl(final UserAPI userAPI) : _userAPI = userAPI;

  @override
  Future<User> update() {
    throw UnimplementedError();
  }

  @override
  Future<User> updateFcmToken() {
    // TODO: implement updateFcmToken
    throw UnimplementedError();
  }

  @override
  Future<void> withdraw() {
    // TODO: implement withdraw
    throw UnimplementedError();
  }
}
