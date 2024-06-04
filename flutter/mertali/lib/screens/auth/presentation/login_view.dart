import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mertaliveonurcan/product/cache/product_cache_manager.dart';
import 'package:mertaliveonurcan/product/init/language/locale_keys.g.dart';
import 'package:mertaliveonurcan/product/navigator.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/mixins/login_view_mixin.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/register_view.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/widgets/hero_logo.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.login).tr(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      ProductStorageManager.deleteAll();
                    },
                    child: const Text('Clear All Data'),
                  ),
                  const HeroLogo(),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.login.tr(),
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Şifre girişi
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Giriş butonu
                  ElevatedButton(
                    onPressed: checkUserTile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Buton rengi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        LocaleKeys.login,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ).tr(),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Kayıt ol butonu
                  ElevatedButton(
                    onPressed: () {
                      PNavigator.nextPage(
                        context,
                        const RegisterView(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white, // Yazı rengi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        LocaleKeys.register,
                        style: TextStyle(fontSize: 18),
                      ).tr(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
