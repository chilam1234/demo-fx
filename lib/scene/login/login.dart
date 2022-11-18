import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../service/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            IntlPhoneField(
              autofocus: true,
              invalidNumberMessage: 'Invalid Phone Number!',
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 25),
              onChanged: (phone) => phoneNumber = phone.completeNumber,
              initialCountryCode: 'IN',
              flagsButtonPadding: const EdgeInsets.only(right: 10),
              showDropdownIcon: false,
              keyboardType: TextInputType.phone,
            ),
            LoginButton(
              icon: FontAwesomeIcons.userNinja,
              text: 'Continue with SMS',
              color: Colors.deepPurple,
              onPressed: () {
                GoRouter.of(context).goNamed(
                  'verifySms',
                  params: {'phoneNumber': phoneNumber},
                );
              },
            ),
            LoginButton(
              icon: FontAwesomeIcons.userNinja,
              text: 'Continue as Guest',
              color: Colors.deepPurple,
              onPressed: () {
                authService.anonLogin();
              },
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  LoginButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        label: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
