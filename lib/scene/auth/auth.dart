import 'package:provider/provider.dart';

import 'package:demo_fx_project/scene/home/home.dart';
import 'package:demo_fx_project/service/auth.dart';
import 'package:flutter/material.dart';

import '../../shared_widget/error.dart';
import '../../shared_widget/loading.dart';
import '../login/login.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<AuthService>().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const Home();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
