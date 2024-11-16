import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:zzekak/di/di_config.dart';
import 'package:zzekak/zzekak_app.dart';

late final GetIt getIt;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await resolveDependency();
  KakaoSdk.init(
      javaScriptAppKey: "1be9d48b92741228526daa7cb8e14ced",
      nativeAppKey: "5264e2b13b4d8bf7d5c0f42f68e11eb0");
  runApp(const ZzekakApp());
}
