import 'package:demo_fx_project/scene/home/home.dart';
import 'package:demo_fx_project/service/api_client.dart';
import 'package:demo_fx_project/util/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final defaultTheme = ThemeData(
    extensions: const <ThemeExtension<dynamic>>[
      InstrumentStyle(
        gain: Color(0xFF48C090),
        loss: Color(0xFFDE5A74),
      ),
    ],
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w800, fontSize: 24),
      elevation: 1,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          // Dependency injection for core component
          Provider<ApiClient>(create: (_) => DioApiClient())
        ],
        child: const Home(),
      ),
      theme: defaultTheme,
    );
  }
}
