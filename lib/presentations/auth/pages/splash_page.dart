import 'package:flutter/material.dart';

import '../../../core/assets/assets.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(milliseconds: 200),
    //   () => context.pushReplacement(const LoginPage()),
    // );
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
