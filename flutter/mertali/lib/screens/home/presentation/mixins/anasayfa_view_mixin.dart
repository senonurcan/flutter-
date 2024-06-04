import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_manager.dart';
import 'package:mertaliveonurcan/product/models/oneri.dart';
import 'package:mertaliveonurcan/product/state/view_model/product_view_model.dart';
import 'package:mertaliveonurcan/screens/home/presentation/anasayfa_view.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_my_sug_controller.dart';
import 'package:mertaliveonurcan/screens/home/presentation/controller/home_rand_sug_controller.dart';

mixin AnasayfaViewMixin on State<AnasayfaView> {
  ScrollController scrollController = ScrollController();
  ScrollController mySugscrollController = ScrollController();

  PageController pageController = PageController();
  List<Oneri> randomOneriler = [];
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        BlocProvider.of<HomeMySugController>(context).clear);
    Future.microtask(
        BlocProvider.of<HomeRandSugController>(context).getRandomSuggestions);
    Future.microtask(
        BlocProvider.of<HomeMySugController>(context).getMySuggestions);
  }

  changeTheme() {
    setState(() {
      switchValue = !switchValue;
    });

    ProductStorageManager.setTheme(theme: switchValue ? 'dark' : 'light');

    BlocProvider.of<ProductViewModel>(context, listen: false).setThemeMode(
      switchValue ? ThemeMode.dark : ThemeMode.light,
    );

    log(context.read<ProductViewModel>().state.themeMode.toString());
  }

  void changeActivePV(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
