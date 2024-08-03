import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_seller_apps/core/assets/assets.dart';
import 'package:flutter_ecommerce_seller_apps/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ecommerce_seller_apps/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/auth/bloc/get_city/get_city_bloc.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/auth/bloc/get_province/get_province_bloc.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/auth/bloc/register/register_bloc.dart';
import 'package:flutter_ecommerce_seller_apps/presentations/auth/pages/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentations/auth/bloc/get_subdistrict/get_subdistrict_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProvinceBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetCityBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetSubdistrictBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.white,
          dialogBackgroundColor: AppColors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.white,
          ),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: AppColors.white),
          dividerTheme: const DividerThemeData(color: AppColors.stroke),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
