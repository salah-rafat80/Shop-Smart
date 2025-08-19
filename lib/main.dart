import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller/card_controller.dart';
import 'View/Screens/login_screen.dart';
import 'View/Screens/main_screen.dart';
import 'helper/routs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardController(),
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Inter',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              height: 1.0,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              height: 1.0,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        // home: LoginScreen(),
      ),
    );
  }
}
