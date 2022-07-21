import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_it/layout/theme.dart';
import 'package:trade_it/models/user.dart';
import 'package:trade_it/screens/addProduct/AddProductScreen.dart';
import 'package:trade_it/screens/addProduct/cubit/productCubit.dart';
import 'package:trade_it/screens/login/LoginPage.dart';
import 'package:trade_it/screens/register/RegistrationPage.dart';

import 'layout/navigation_container.dart';
import 'screens/onboard/onboard.dart';

String initialRouteString = "/onboard";
void main() {
  //await Future.delayed(const Duration(seconds: 0));
  runApp(TradeITApp());
}

void setInitialRoute() async {
  bool? firstUse = await checkFirstUse();
  bool? userCheck = await checkUser();
  if (firstUse) {
    if (userCheck) {
      initialRouteString = "/login";
    } else {
      initialRouteString = "/home";
    }
  }
  print(initialRouteString);
}

class TradeITApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setInitialRoute();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddProductCubit(),
        ),
      ],
      child: MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        initialRoute: initialRouteString,
        routes: {
          '/onboard': (context) => const Onboard(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegistrationPage(),
          '/home': (context) => const NavigationContainer(
                index: 0,
              ),
          '/addProduct': (context) => AddProductScreen(),
        },
      ),
    );
  }
}
