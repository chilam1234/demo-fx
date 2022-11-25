import 'package:demo_fx_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
