//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-09
//

import 'package:core/model/identifier/identifier.dart';
import 'package:core/model/representable/representable.dart';
import 'package:equatable/equatable.dart';

/// zzekak_client 의 사용자를 표현합니다.
abstract interface class User {
  /// 유저를 식별할 수 있는 고유한 값을 의미합니다.
  Identifier get identifier;

  /// 유저가 회원가입 과정에서 설정한 닉네임
  NickName get nickName;

  factory User(Identifier identifier, NickName nickName) =>
      _UserImpl(identifier, nickName);
}

final class _UserImpl extends Equatable implements User {
  @override
  final Identifier identifier;
  @override
  final NickName nickName;

  const _UserImpl(this.identifier, this.nickName);

  @override
  List<Object> get props => [
        identifier,
        nickName,
      ];

  @override
  bool get stringify => true;
}
