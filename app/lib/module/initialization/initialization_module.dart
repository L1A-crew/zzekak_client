//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-08-10
//

import 'package:bloc/bloc.dart';
import 'package:core/model/auth_token/auth_token.dart';
import 'package:core/repository/token_provider/token_provider.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zzekak/module/initialization/state_n_event.dart';
import 'package:zzekak/firebase_options.dart';

final class InitializationModule
    extends Bloc<AppInitializationEvent, AppInitializationState> {
  final TokenProvider _tokenProvider;

  @visibleForTesting
  InitializationModule(super.initialState)
      : _tokenProvider = GetIt.instance.get<TokenProvider>() {
    on<AppInitializationEvent>((
      final AppInitializationEvent event,
      final Emitter<AppInitializationState> emitter,
    ) async {
      switch (event) {
        case WhenInitialized():
          await _onInitialized(event, emitter);
        case WhenReInitialized():
          await _onReInitialized(event, emitter);
      }
    });
  }

  factory InitializationModule.newInstance() =>
      InitializationModule(const Uninitialized());

  Future<FirebaseApp> get firebaseInitialize =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
          .then((it) {
        FirebaseMessaging.onMessage.listen(
          (final RemoteMessage message) {
            Logger().i("FCM message received ${message.data}");
            // TODO: local notification 이용해 알림 표시
          },
        );
        return it;
      });

  Future<void> _onInitialized(
    final AppInitializationEvent event,
    final Emitter<AppInitializationState> emitter,
  ) async {
    // 초기화 이후 다시 초기화 되는 경우를 방지
    if (state is Initialized) return;
    final initialFuture = await (
      firebaseInitialize,
      Permission.notification.isGranted,
      _tokenProvider.findMe()
    ).wait;

    if (initialFuture.isNotificationGranted) {
      getFCMToken.also((final Future<String?> Function() couldBeToken) async {
        final res = await couldBeToken();
        if (res is String) {
          Logger().i("FCM token acquired $res");
        }
      });
    }

    await Future.delayed(const Duration(milliseconds: 500));

    emitter(Initialized(
      authInfo: await _tokenProvider.findMe(),
    ));
  }

  Future<void> _onReInitialized(
    final AppInitializationEvent event,
    final Emitter<AppInitializationState> emitter,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emitter(Initialized(
      authInfo: await _tokenProvider.findMe(),
    ));
  }
}

Future<String?> getFCMToken() async {
  try {
    return await FirebaseMessaging.instance.getToken(
        vapidKey:
            "BG9suwndw3o84ga9UK3WUOPJBEp0wY10EKaRzDeNLFGYRY36AlmGud81KwFJg_-S7ZRiPOXiJp72gGs_9n7Cxr0");
  } catch (e, s) {
    Logger().e("FCM token acquire failed $e\n $s");
    return null;
  }
}

extension on (FirebaseApp, bool, AuthToken?) {
  FirebaseApp get firebaseApp => $1;

  bool get isNotificationGranted => $2;

  AuthToken? get authInfo => $3;
}
