import 'package:equatable/equatable.dart';

/// zzekak_client 의 식별정보.
final class AuthToken extends Equatable {
  final String accessToken;

  final String refreshToken;

  const AuthToken(this.accessToken, this.refreshToken);

  @override
  List<Object> get props => [accessToken, refreshToken];
}
