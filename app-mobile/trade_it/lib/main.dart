import 'package:flutter/material.dart';
import 'package:trade_it/layout/theme.dart';
import 'package:trade_it/screens/ProductDetails/productDetails.dart';

import 'layout/homePage.dart';
import 'screens/onboard/onboard.dart';

void main() {
  //await Future.delayed(const Duration(seconds: 0));
  runApp(TradeITApp());
}

class TradeITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboard',
      routes: {
        '/onboard': (context) => const Onboard(),
        '/home': (context) => const HomePage(),
        '/details': (context) => const ProductDetails(),
      },
    );
  }
}
