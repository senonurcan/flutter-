import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mertaliveonurcan/product/navigation/app_routes.dart';
import 'package:mertaliveonurcan/product/navigator.dart';
import 'package:mertaliveonurcan/screens/home_shell/presentation/controller/home_shell_controller.dart';

final class HomeShellView extends StatefulWidget {
  const HomeShellView({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  State<HomeShellView> createState() => _HomeShellViewState();
}

class _HomeShellViewState extends State<HomeShellView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: widget.child,
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      items: _bottomBarItems,
      currentIndex: context.watch<HomeShellController>().state,
      onTap: _onTap,
    );
  }

  List<BottomNavigationBarItem> get _bottomBarItems => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ];

  void _onTap(int value) {
    context.read<HomeShellController>().changeIndex(value);
    switch (value) {
      case 0:
        PNavigator.nextPageAndRemoveUntil(context, AppRoutes.home.location);
        break;
      case 1:
        context.go(AppRoutes.profile.location);
        break;
    }
  }
}
