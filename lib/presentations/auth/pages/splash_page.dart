import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_seller_apps/core/core.dart';

import '../../../core/assets/assets.dart';
import 'login_page.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => context.pushReplacement(const LoginPage()),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(130.0),
        child: Center(
          child: Assets.images.logo.image(),
        ),
      ),
    );
  }
}
