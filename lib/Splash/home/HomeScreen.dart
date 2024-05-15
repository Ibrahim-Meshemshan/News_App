import 'package:flutter/material.dart';
import 'package:news_app/MyTheme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: MyTheme.whiteColor,
        image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('News App',style: Theme.of(context).textTheme.titleLarge,),
        ),
        body: Container(),
      ),
    );
  }
  /// adb949e7be28414a8b0eb647e4696f0a {api_key}
}
