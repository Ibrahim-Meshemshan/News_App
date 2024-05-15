import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';
import 'package:news_app/Splash/home/HomeScreen.dart';
import 'package:news_app/Splash/splash_screen.dart';

import 'category/category_detailse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryDetails.routeName,
      routes: {
        SplashScreen.routeName : (context) => SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        CategoryDetails.routeName : (context) => CategoryDetails(),

      },
      theme: MyTheme.lightTheme
    );
  }
}
