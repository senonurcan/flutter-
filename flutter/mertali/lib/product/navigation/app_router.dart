import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mertaliveonurcan/product/navigation/app_routes.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/login_view.dart';
import 'package:mertaliveonurcan/screens/board/presentation/board_screen.dart';
import 'package:mertaliveonurcan/screens/home/presentation/anasayfa_view.dart';
import 'package:mertaliveonurcan/screens/profile/controller/profile_controller.dart';
import 'package:mertaliveonurcan/screens/profile/profile_view.dart';
import 'package:mertaliveonurcan/screens/home_shell/presentation/controller/home_shell_controller.dart';
import 'package:mertaliveonurcan/screens/home_shell/presentation/home_shell_view.dart';

final class AppRouter {
  AppRouter._();
  static final AppRouter _instance = AppRouter._();
  static final AppRouter instance = _instance;
  final router = _router;
}

final _router = GoRouter(
  initialLocation: AppRoutes.board.location,
  routes: [
    GoRoute(
      path: AppRoutes.board.location,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const BoardView(),
          transitionsBuilder: _slideTransition,
        );
      },
    ),
    GoRoute(
      path: AppRoutes.login.location,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LoginView(),
          transitionsBuilder: _slideTransition,
        );
      },
    ),
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (context) => HomeShellController(),
        child: HomeShellView(
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          path: AppRoutes.home.location,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const AnasayfaView(),
              transitionsBuilder: _slideTransition,
            );
          },
        ),
        GoRoute(
          path: AppRoutes.profile.location,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (context) => ProfileController(),
                child: const ProfileView(),
              ),
              transitionsBuilder: _slideTransition,
            );
          },
        ),
      ],
    ),
  ],
);

Widget _slideTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const Offset begin = Offset(1.0, 0.0); // Başlangıç noktası (ekranın sağ dışı)
  const Offset end = Offset.zero; // Bitiş noktası (ekranın ortası)
  const Curve curve = Curves.easeInOut; // Animasyon eğrisi

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
