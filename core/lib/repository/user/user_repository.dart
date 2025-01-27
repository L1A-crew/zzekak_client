import 'package:core/model/user/user_model.dart';

abstract interface class UserRepository {
  Future<User> update();

  Future<User> updateFcmToken();

  Future<void> withdraw();
}
