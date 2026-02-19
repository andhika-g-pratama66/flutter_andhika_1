import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_10/elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Login', style: TextStyle(fontSize: 40)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('saya login');
              },
              child: Text('Login'),
            ),
            ElevatedButton10(text: 'Register'),
          ],
        ),
      ],
    );
  }
}
