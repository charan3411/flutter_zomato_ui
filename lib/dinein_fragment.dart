
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiningFragment extends StatelessWidget {
  DiningFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
