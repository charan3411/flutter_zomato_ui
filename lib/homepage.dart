import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  static const String routeName = '/homepage';

  var text;

  HomePage({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: const Center(child: Text("This is Home page")));
  }
}