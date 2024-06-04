import 'package:flutter/material.dart';
import 'package:mertaliveonurcan/product/models/auth_request.dart';
import 'package:mertaliveonurcan/product/navigation/app_routes.dart';
import 'package:mertaliveonurcan/product/navigator.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/controller/auth_manager.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/login_view.dart';

mixin LoginViewMixin on State<LoginView> {
  final emailController = TextEditingController(text: "eve.holt@reqres.in");
  final passwordController = TextEditingController();
  final AuthManager authManager = AuthManager();

  checkUserTile() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final response = await authManager.login(
        AuthRequest(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (response) {
        nextPage();
      }
    } else {
      return;
    }
  }

  nextPage() {
    PNavigator.nextPageAndRemoveUntil(
      context,
      AppRoutes.home.location,
    );
  }
}
