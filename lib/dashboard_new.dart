import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zomato_ui/profile_page.dart';
import 'package:flutter_zomato_ui/refer.dart';
import 'constant.dart';
import 'dashboard.dart';
import 'settings.dart';
import 'login.dart';

class dashboard_new extends StatelessWidget {
  const dashboard_new({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      routes : <String, WidgetBuilder>{
        PROFILE_SCREEN: (BuildContext context) => ProfilePage(),
        REFER_SCREEN: (BuildContext context) => Refer(),
        SETTINGS_SCREEN: (BuildContext context) => Settings(),
      },
    );
  }
}

