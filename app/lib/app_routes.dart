part of '../zzekak_app.dart';

const _pathSplash = "/";
const _pathLogin = "/login";
const _pathHome = "/home";

enum AppRoutes {
  SPLASH(_pathSplash),
  LOGIN(_pathLogin),
  HOME(_pathHome);

  final String path;

  const AppRoutes(this.path);
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.SPLASH.path,
      name: AppRoutes.SPLASH.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.HOME.path,
      name: AppRoutes.HOME.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
