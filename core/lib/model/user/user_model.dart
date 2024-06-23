//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-09
//

import 'package:equatable/equatable.dart';

/// zzekak_client 의 식별정보.
abstract interface class AuthenticationInfo {
  String get accessToken;

  String get refreshToken;

  factory AuthenticationInfo(String accessToken, String refreshToken) =>
      _UserImpl(accessToken, refreshToken);
}

final class _UserImpl extends Equatable implements AuthenticationInfo {
  @override
  final String accessToken;
  @override
  final String refreshToken;

  const _UserImpl(this.accessToken, this.refreshToken);

  @override
  List<Object> get props => [
        accessToken,
        refreshToken,
      ];

  @override
  bool get stringify => true;
}
