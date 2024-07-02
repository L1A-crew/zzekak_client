import 'package:core/repository/token_provider/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:zzekak/screen/home/v_home.dart';
import 'package:zzekak/screen/login/v_login.dart';
import 'package:zzekak/screen/splash/v_splash.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path, name: SplashRoute.name)
class SplashRoute extends GoRouteData {
  static const String path = 'splash';
  static const String name = 'splash';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.PATH, name: HomeRoute.NAME)
class HomeRoute extends GoRouteData {
  static const String PATH = '/';
  static const String NAME = 'home';

  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.PATH, name: LoginRoute.NAME)
class LoginRoute extends GoRouteData {
  static const String PATH = '/login';
  static const String NAME = 'login';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LoginScreen(di: GetIt.instance);
}

final GoRouter router = GoRouter(
  routes: $appRoutes,
  redirect: (final BuildContext context, final GoRouterState state) async {
    (await GetIt.instance.get<TokenProvider>().findMe()).also((it) {
      print(it);
    });
    return null;
  },
);
