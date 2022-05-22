import 'package:flutter/material.dart';

import 'homePage.dart';
import 'onboard.dart';

void main() {
   //await Future.delayed(const Duration(seconds: 0));
   runApp(TradeITApp());
   }

class TradeITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboard',
      routes: {
        '/onboard': (context) => const Onboard(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
