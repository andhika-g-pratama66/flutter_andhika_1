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
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create an Account', style: TextStyle(fontSize: 24)),
            RichText(
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
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text('Email Address'),
            TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'email@gmail.com',
                labelText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 12),
            Text('Password'),
            TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                labelText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 12),
            Text('Confirm Password'),
            TextFormField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                labelText: 'Enter your password',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
