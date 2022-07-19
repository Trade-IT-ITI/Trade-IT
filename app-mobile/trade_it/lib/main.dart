import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_it/layout/theme.dart';
import 'package:trade_it/screens/login/LoginPage.dart';
import 'package:trade_it/screens/register/RegistrationPage.dart';

import 'layout/navigation_container.dart';
import 'screens/onboard/onboard.dart';

void main() {
  //await Future.delayed(const Duration(seconds: 0));
  runApp(TradeITApp());
}

class TradeITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddProductCubit(),
        ),
        BlocProvider(
          create: (context) => PickingImageCubit(),
        ),
      ],
      child: MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        //initialRoute: '/onboard',
        routes: {
          '/onboard': (context) => const Onboard(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegistrationPage(),
          '/home': (context) => const NavigationContainer(
                index: 0,
              ),
          '/details': (context) => ProductDetails(),
          '/addProduct': (context) => AddProductScreen(),
        },
      ),
    );
  }
}
