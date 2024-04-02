import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zzekak/zzekak_app.dart';
import 'di/app_di_config.dart';

late final GetIt getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ZzekakApp());
}
