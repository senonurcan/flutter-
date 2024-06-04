import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mertaliveonurcan/product/init/language/locale_keys.g.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/mixins/register_view_mixin.dart';
import 'package:mertaliveonurcan/screens/auth/presentation/widgets/hero_logo.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.register).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeroLogo(),
            const SizedBox(height: 20),
            // Kullanıcı adı girişi
            TextFormField(
              decoration: InputDecoration(
                labelText: 'UserName',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // E-posta girişi
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Şifre girişi
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Kayıt butonu
            ElevatedButton(
              onPressed: checkUserTile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Buton rengi
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text(
                  LocaleKeys.register,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ).tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
