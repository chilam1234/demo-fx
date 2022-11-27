import 'package:flutter/material.dart';
import '../../service/auth.dart';
import '../../shared_widget/error.dart';
import '../../shared_widget/loading.dart';
import '../login/login.dart';
import '../dashboard/dashboard.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Center(
              child: ErrorMessage(),
            );
          } else if (snapshot.hasData) {
            return const Scaffold(body: Dashboard());
          } else {
            return const LoginScreen();
          }
        });
  }
}
