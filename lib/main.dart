import 'package:demo_fx_project/model/instrument.dart';
import 'package:demo_fx_project/scene/auth/auth.dart';
import 'package:demo_fx_project/scene/instrument/instrument_screen.dart';
import 'package:demo_fx_project/scene/search/search.dart';
import 'package:demo_fx_project/scene/verify_phone_screen/verify_phone_screen.dart';
import 'package:demo_fx_project/service/api_client.dart';
import 'package:demo_fx_project/service/auth.dart';
import 'package:demo_fx_project/service/stock_service.dart';
import 'package:demo_fx_project/service/user_setting_service.dart';
import 'package:demo_fx_project/util/theme_extension.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
  final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(path: '/', builder: (context, state) => const AuthScreen()),
    GoRoute(
      name: 'search',
      path: '/search',
      builder: (context, state) => const SearchInstrument(),
    ),
    GoRoute(
      name: 'verifySms',
      path: '/sms/verify/:phoneNumber',
      builder: (context, state) => VerifyPhoneNumberScreen(
        phoneNumber: state.params['phoneNumber'] ?? '',
      ),
    ),
    GoRoute(
        path: '/instrument/:instrumentName',
        name: 'instrumentDetail',
        builder: (context, state) {
          Instrument? instrument;
          var extra = state.extra;
          if (extra is Instrument) {
            instrument = extra;
          } else {
            instrument = Instrument(name: state.params['instrumentName'] ?? '');
          }
          return InstrumentScreen(
            instrument: instrument,
          );
        }),
  ]);

  final defaultTheme = ThemeData(
    extensions: const <ThemeExtension<dynamic>>[
      InstrumentStyle(
        gain: Color(0xFF48C090),
        loss: Color(0xFFDE5A74),
      ),
    ],
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w800, fontSize: 24),
      elevation: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(fontWeight: FontWeight.normal),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100)),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Dependency injection for core component
        Provider<ApiClient>(create: (_) => DioApiClient()),
        Provider<StockService>(
            create: (context) => StockService(context.read<ApiClient>())),
        Provider<AuthService>(create: (_) => AuthService()),
        ListenableProvider<UserSettingService>(
            create: (context) => UserSettingService()..fetch()),
      ],
      child: FirebasePhoneAuthProvider(
          child: MaterialApp.router(
        routerConfig: _router,
        theme: defaultTheme,
      )),
    );
  }
}
