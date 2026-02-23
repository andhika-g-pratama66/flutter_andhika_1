import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: RichText(
          text: TextSpan(
            text: "Already have an account?",
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Sign in',
                style: TextStyle(color: Colors.orange.shade700),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                    // navigate to desired screen
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
