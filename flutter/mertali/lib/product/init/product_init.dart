// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mertaliveonurcan/main.dart';
import 'package:mertaliveonurcan/product/init/product_localization.dart';
import 'package:mertaliveonurcan/product/init/state_initialize.dart';

@immutable
final class Init {
  Init.make() {
    WidgetsFlutterBinding.ensureInitialized();
    _init();
  }

  void _init() async {
    runApp(
      StateInitialize(
        child: ProductLocalization(
          child: const MyApp(),
        ),
      ),
    );
  }
}
