import 'package:core/model/user/user_model.dart';

abstract interface class UserService {
  Future<User> getUser();

  Future<User> upDateFCMToken(String fcmToken);

  Future<User> upDateProfileImg(String profileImg);
}
