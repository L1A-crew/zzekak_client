//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-10
//

import 'package:core/model/auth_token/auth_token.dart';
import 'package:equatable/equatable.dart';

/// Zzekak App의 초기화 여부를 나타내는 상태
sealed class AppInitializationState extends Equatable {
  const AppInitializationState();
}

/// 초기화되지 않은 상태
final class Uninitialized extends AppInitializationState {
  const Uninitialized();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

/// 초기화가 완료된 상태
final class Initialized extends AppInitializationState {
  final AuthToken? authInfo;

  const Initialized({
    required this.authInfo,
  });

  @override
  List<Object?> get props => [authInfo];

  @override
  bool get stringify => true;
}

/// Zzekak App 의 초기화 관련 이벤트
sealed class AppInitializationEvent extends Equatable {
  const AppInitializationEvent();
}

/// 초기화를 시작하는 이벤트
final class WhenInitialized extends AppInitializationEvent {
  const WhenInitialized();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

/// 초기화를 다시 시작하는 이벤트
final class WhenReInitialized extends AppInitializationEvent {
  const WhenReInitialized();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
