//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-04-16
//

import 'package:bloc/bloc.dart';
import 'package:core/model/auth_token/auth_token.dart';
import 'package:core/model/auth_token/trd_auth_token.dart';
import 'package:core/repository/token_provider/token_provider.dart';
import 'package:data/api/auth_api/user_api.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:zzekak/mixin/login.dart';

final class LoginViewState extends Equatable {
  final AuthToken? authenticationInfo;
  final bool? isFirstLogin;

  const LoginViewState({
    required this.authenticationInfo,
    required this.isFirstLogin,
  });

  @override
  List<Object?> get props => [
        authenticationInfo,
        isFirstLogin,
      ];

  @override
  bool get stringify => true;

  static const LoginViewState empty = LoginViewState(
    authenticationInfo: null,
    isFirstLogin: null,
  );
}

final class LoginViewModel extends Cubit<LoginViewState>
    with CertificationUsecase {
  static LoginViewModel? _instance;
  final TokenProvider _tokenProvider;
  final UserAPI _authenticationAPI;

  LoginViewModel(
    super.initialState, {
    required final TokenProvider tokenProvider,
    required final UserAPI authenticationAPI,
  })  : _tokenProvider = tokenProvider,
        _authenticationAPI = authenticationAPI;

  factory LoginViewModel.newInstance() {
    final getIt = GetIt.instance;
    return LoginViewModel._instance ??
        (LoginViewModel._instance = LoginViewModel(
          LoginViewState.empty,
          tokenProvider: getIt.get<TokenProvider>(),
          authenticationAPI: getIt.get<UserAPI>(),
        ));
  }

  Future<void> whenLoginBtnTapped(final SocialLoginEvent event) async {
    final ThirdPartyAuthToken token;
    try {
      token = await socialLogin(event: event);
      Logger().i("Social login successful: ${token.oAuthToken}");
    } catch (e, stackTrace) {
      Logger().e("Error during social login", error: e, stackTrace: stackTrace);
      emit(LoginViewState.empty);
      return;
    }

    final JoinOrLoginResponse res;
    try {
      Logger().i("Calling joinOrLogin API...");
      res = await _authenticationAPI.joinOrLogin(JoinOrLoginRequest(
        token: token.oAuthToken,
        provider: switch (token) {
          KakaoTalkAuthToken() => AuthProvider.kakao,
          AppleAuthToken() => AuthProvider.apple,
        },
      ));
      Logger().i("API response received: ${res.tokenContent}");
    } catch (e, stackTrace) {
      Logger().e("Error during joinOrLogin API call",
          error: e, stackTrace: stackTrace);
      emit(LoginViewState.empty);
      return;
    }

    final AuthToken authInfo = AuthToken(
      res.tokenContent.accessToken,
      res.tokenContent.refreshToken,
    );

    try {
      Logger().i("Saving authentication info...");
      await _tokenProvider.saveToken(authInfo);
      Logger().i("Authentication info saved successfully.");
    } catch (e, stackTrace) {
      Logger().e("Error while saving authentication info",
          error: e, stackTrace: stackTrace);
      emit(LoginViewState.empty);
      return;
    }

    emit(LoginViewState(
      authenticationInfo: authInfo,
      isFirstLogin: res.isFirstLogin,
    ));

    Logger().i("Login process completed: First login = ${res.isFirstLogin}");
  }
}
