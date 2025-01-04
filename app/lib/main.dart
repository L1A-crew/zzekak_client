import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:logger/logger.dart';
import 'package:zzekak/di/di_config.dart';
import 'package:zzekak/stub.dart'
    if (dart.html) 'package:zzekak/web_uri_setup.dart';
import 'package:zzekak/zzekak_app.dart';

late final GetIt getIt;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  Logger().i("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  initializeDateFormatting('ko_KR');
  await resolveDependency();
  KakaoSdk.init(
    javaScriptAppKey: dotenv.get("KAKAO_JS_KEY"),
    nativeAppKey: dotenv.get("KAKAO_NATIVE_KEY"),
  );
  webSetUp();
  Bloc.observer = ZzekakBlocObserver();
  runApp(const ZzekakApp());
}

class ZzekakBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger().i(
        "Bloc:$bloc changed\ncurrent:${change.currentState}\nnext:${change.nextState}");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger().i(
        "Bloc:$bloc transitioned\nprevious:${transition.currentState}\ncurrent:${transition.nextState}");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger().i("Bloc:$bloc event:$event");
  }
}
