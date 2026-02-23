import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/home_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool passwordObscured = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset:
          false, //Supaya tidak overflow saat keyboard muncul
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 56),
        child: Column(
          children: [
            Text('Welcome Back', style: TextStyle(fontSize: 24)),
            Text('Sign in to your account'),
            SizedBox(height: 108),
            //Form Email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'email@gmail.com',
                labelText: 'Email',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            //Form Password
            TextFormField(
              obscureText: !passwordObscured, //Supaya
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(Icons.key),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        passwordObscured = true;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        passwordObscured = true;
                      });
                    },
                    onLongPressEnd: (_) {
                      setState(() {
                        passwordObscured = false;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        passwordObscured = false;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        passwordObscured = false;
                      });
                    },
                    child: Icon(
                      passwordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),

            SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value!;
                    });
                  },
                  // title:
                ),
                Text('Remember me'),
                Spacer(),
                GestureDetector(
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.orange.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  onTap: () {
                    print('Forgot password');
                  },
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
                print('login');
              },

              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(double.maxFinite, 56)),

                backgroundColor: WidgetStatePropertyAll(Colors.green),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: Divider()),
                Text('  OR  '),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Google',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Image.asset('assets/icons/google.png', height: 18),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Facebook',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Image.asset('assets/icons/facebook.png', height: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign up',
                      style: TextStyle(color: Colors.orange.shade700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                          // navigate to desired screen
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
