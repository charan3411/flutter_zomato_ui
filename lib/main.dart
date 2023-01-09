import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zomato_ui/dashboard_new.dart';
import 'package:flutter_zomato_ui/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const splashscreen());
}

class splashscreen extends StatelessWidget {
  const splashscreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Georgia',
      ),
      home: const MySplashscreen(title: 'Zomato Sample'),
    );
  }
}

class MySplashscreen extends StatefulWidget {
  const MySplashscreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MySplashscreen> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashscreen> {
  @override
  void initState() {
    super.initState();

    getLoginStatus();
  }

  getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value =  prefs.getBool('isLogin') ?? false;
    if (!value) {
      Timer(
          const Duration(seconds: 3),
              () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const LoginPage())));
    } else {
      Timer(
          const Duration(seconds: 3),
              () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const dashboard_new())));    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
