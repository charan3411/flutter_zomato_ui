import 'package:flutter/material.dart';


class Settings extends StatelessWidget {
  static const String routeName = '/settings';

  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: const Center(child: Text("This is Settings page")));
  }
}