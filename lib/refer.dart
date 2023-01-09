import 'package:flutter/material.dart';


class Refer extends StatelessWidget {
  static const String routeName = '/ReferPage';

  const Refer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Refer"),
        ),
        body: const Center(child: Text("This is Refer page")));
  }
}