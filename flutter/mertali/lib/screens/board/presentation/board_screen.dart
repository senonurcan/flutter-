import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mertaliveonurcan/product/init/language/locale_keys.g.dart';
import 'package:mertaliveonurcan/product/init/product_localization.dart';
import 'package:mertaliveonurcan/product/navigation/app_routes.dart';
import 'package:mertaliveonurcan/product/utility/product_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'controller/board_controller.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends BoardController {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İstinye'),
        leading: IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            ProductLocalization.updateLangEx(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                IntroPage(
                  title: LocaleKeys.board_title_1.tr(),
                  description: LocaleKeys.board_description_1,
                ),
                IntroPage(
                  title: LocaleKeys.board_title_2.tr(),
                  description: LocaleKeys.board_description_2,
                ),
                IntroPage(
                  title: LocaleKeys.board_title_3.tr(),
                  description: LocaleKeys.board_description_3,
                  button: ElevatedButton(
                    onPressed: () {
                      context.go(AppRoutes.login.location);
                    },
                    child: const Text(LocaleKeys.login).tr(),
                  ),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            onDotClicked: (index) => _controller.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut),
            effect: const WormEffect(), // SmoothPageIndicator efekti
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final Widget? button;

  const IntroPage({
    super.key,
    required this.title,
    required this.description,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title.tr(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            description.tr(),
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          if (button != null) button!,
        ],
      ),
    );
  }
}
