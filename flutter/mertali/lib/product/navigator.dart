import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PNavigator {
  static nextPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static backPage(BuildContext context) {
    Navigator.pop(context);
  }

  static backPageWithData(BuildContext context, dynamic data) {
    Navigator.pop(context, data);
  }

  static nextPageAndRemoveUntil(BuildContext context, String location) {
    GoRouter.of(context).pushReplacement(location);
  }
}
