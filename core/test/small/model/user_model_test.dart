import 'package:core/model/auth_token/trd_auth_token.dart';
import 'package:core/model/user/user_model.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() {
  group("User model 은", () {
    test("ID 를 기반으로 동일 여부를 판정한다.", () {
      final user1 = getRandomUser("1");
      final user2 = getRandomUser("1");
      final user3 = getRandomUser("2");

      expect(user1, user2);
      expect(user1, isNot(user3));
    });
  });
}

User getRandomUser(String? id) {
  return User(
    id: id ?? Faker().guid.guid(),
    authenticationInfo: AuthenticationInfo(
      id: Faker().guid.guid(),
      provider: ([...ThirdPartyProvider.values]..shuffle()).first,
      createdAt: Faker().date.dateTime(),
      updatedAt: Faker().date.dateTime(),
    ),
    agreementOfTerms: AgreementOfTerms(
      isAgreedMarketingConsent: Faker().date.dateTime(),
      isAgreedLocationConsent: Faker().date.dateTime(),
      isAgreedPushNotificationConsent: Faker().date.dateTime(),
    ),
    createdAt: Faker().date.dateTime(),
    updatedAt: Faker().date.dateTime(),
    fcmToken: Faker().lorem.word(),
  );
}
