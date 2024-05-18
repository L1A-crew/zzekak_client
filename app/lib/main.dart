import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:zzekak/zzekak_app.dart';

late final GetIt getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
      javaScriptAppKey: "de156183248b7dfe546344b070cd40f0",
      nativeAppKey: "2d51c85d511073700883627e53665974");
  runApp(const ZzekakApp());
}
