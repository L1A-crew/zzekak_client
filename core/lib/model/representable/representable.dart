//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-09
//

/// 자신을 표현할 수 있는 능력을 가진 객체를 나타내는 인터페이스
abstract interface class Representable {
  String represent();
}

/// 유저가 회원가입 과정에서 설정한 닉네임
final class NickName implements Representable {
  final String _nickName;

  const NickName(this._nickName);

  @override
  String represent() => _nickName;

  @override
  String toString() => "NickName: $_nickName";
}
