import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_manager.dart';
import 'package:mertaliveonurcan/product/init/product_init.dart';
import 'package:mertaliveonurcan/product/navigation/app_router.dart';
import 'package:mertaliveonurcan/product/state/view_model/product_view_model.dart';
import 'package:mertaliveonurcan/product/theme/product_theme.dart';

void main() => Init.make();

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkTheme(context);
    super.initState();
  }

  void checkTheme(BuildContext context) {
    ProductStorageManager.getTheme().then(
      (theme) {
        if (theme != null) {
          BlocProvider.of<ProductViewModel>(context).setThemeMode(
            theme == 'dark' ? ThemeMode.dark : ThemeMode.light,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ProductViewModel>().state.themeMode == ThemeMode.dark
          ? ProductTheme.instance.darkTheme
          : ProductTheme.instance.lightTheme,
      routerDelegate: AppRouter.instance.router.routerDelegate,
      routeInformationParser: AppRouter.instance.router.routeInformationParser,
      routeInformationProvider:
          AppRouter.instance.router.routeInformationProvider,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
    );
  }
}
