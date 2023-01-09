
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard_model.dart';

class WalletFragment extends StatelessWidget {
  const WalletFragment({Key? key}) : super(key: key);

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
