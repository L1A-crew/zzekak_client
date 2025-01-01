import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:zzekak/components/calendar.dart';
import 'package:zzekak/module/initialization/initialization_module.dart';
import 'package:zzekak/module/initialization/state_n_event.dart';
import 'package:zzekak/screen/appointment_setup/v_appointment_setup.dart';
import 'package:zzekak/screen/home/v_home.dart';
import 'package:zzekak/screen/login/v_login.dart';
import 'package:zzekak/screen/sign_in/agree_of_terms/agree_of_terms_screen.dart';
import 'package:zzekak/screen/sign_in/nickname/nickname_screen.dart';
import 'package:zzekak/screen/signed/v_signed.dart';
import 'package:zzekak/screen/splash/v_splash.dart';

part 'app_routes.g.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  redirect: _initializationRedirectionLogic,
);

@TypedGoRoute<SplashRoute>(path: SplashRoute.path, name: SplashRoute.name)
class SplashRoute extends GoRouteData {
  static const String path = '/splash';
  static const String name = 'splash';

  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SplashScreen(
        module: GetIt.instance.get<InitializationModule>(),
      );
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.PATH, name: HomeRoute.NAME)
class HomeRoute extends GoRouteData {
  static const String PATH = '/';
  static const String NAME = 'home';

  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.PATH, name: LoginRoute.NAME)
class LoginRoute extends GoRouteData {
  static const String PATH = '/login';
  static const String NAME = 'login';

  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LoginScreen(di: GetIt.instance);
}

@TypedGoRoute<CalendarRoute>(path: CalendarRoute.PATH, name: CalendarRoute.NAME)
class CalendarRoute extends GoRouteData {
  static const String PATH = '/calendar';
  static const String NAME = 'calendar';

  const CalendarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CalendarScreen(di: GetIt.instance);
}

/// 약속 생성 화면
@TypedGoRoute<AppointmentSetupRoute>(
    path: AppointmentSetupRoute.PATH, name: AppointmentSetupRoute.NAME)
class AppointmentSetupRoute extends GoRouteData {
  static const String PATH = '/appointment-setup';
  static const String NAME = 'appointment-setup';

  const AppointmentSetupRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) =>
      AppointmentSetupView(di: GetIt.instance);
}

@TypedGoRoute<SignedRoute>(path: SignedRoute.PATH, name: SignedRoute.NAME)
class SignedRoute extends GoRouteData {
  static const String PATH = '/signed';
  static const String NAME = 'signed';

  const SignedRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SignedScreen(di: GetIt.instance);
}

@TypedGoRoute<AgreeOfTermsRoute>(
    path: AgreeOfTermsRoute.PATH, name: AgreeOfTermsRoute.NAME)
final class AgreeOfTermsRoute extends GoRouteData {
  static const String PATH = '/agree-of-terms';
  static const String NAME = 'agree-of-terms';

  const AgreeOfTermsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AgreeOfTermsScreen();
}

@TypedGoRoute<NickNameScreenRoute>(
    path: NickNameScreenRoute.PATH, name: NickNameScreenRoute.NAME)
final class NickNameScreenRoute extends GoRouteData {
  static const String PATH = '/nickname';
  static const String NAME = 'nickname';

  const NickNameScreenRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => NicknameScreen();
}

FutureOr<String?> _initializationRedirectionLogic(
    final BuildContext context, final GoRouterState state) async {
  if (GetIt.instance.get<InitializationModule>().state is Uninitialized) {
    return SplashRoute.path;
  }

  return null;
}
