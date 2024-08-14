import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_seller_apps/core/core.dart';
import 'package:flutter_ecommerce_seller_apps/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/home/pages/main_page.dart';

import '../../../core/assets/assets.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(milliseconds: 2000),
    //   () => context.pushReplacement(const LoginPage()),
    // );
    return Scaffold(
      body: FutureBuilder<bool>(
        future: Future.delayed(
          const Duration(milliseconds: 2000),
          () => AuthLocalDatasource().checkAuthData(),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return const MainPage();
              } else {
                return const LoginPage();
              }
            }
          }
          return Padding(
            padding: const EdgeInsets.all(130.0),
            child: Center(
              child: Assets.images.logo.image(),
            ),
          );
        },
      ),
    );
  }
}
