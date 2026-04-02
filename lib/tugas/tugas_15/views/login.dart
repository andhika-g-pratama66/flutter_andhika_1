import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/constants/button_style.dart';
import 'package:flutter_andhika_1/constants/default_font.dart';
import 'package:flutter_andhika_1/constants/form_decoration.dart';
import 'package:flutter_andhika_1/database/preference.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/api/login_api.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/profile.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/register.dart';

class LoginUserT15 extends StatefulWidget {
  const LoginUserT15({super.key});

  @override
  State<LoginUserT15> createState() => _LoginUserT15State();
}

class _LoginUserT15State extends State<LoginUserT15> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscured = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    try {
      final result = await loginUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (result == null) {
        throw Exception("Login gagal, data kosong");
      }

      await PrefsHandler.storingToken(result.token ?? "");

      final savedToken = await PrefsHandler.getToken();
      log("TOKEN TERSIMPAN: $savedToken");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.message ?? 'Login berhasil!'),
          backgroundColor: Colors.green,
        ),
      );

      // pindah halaman setelah token benar-benar tersimpan
      context.pushReplacement(const MyProfile());
    } on ApiException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 28),
                Text('Welcome Back', style: DefaultFont.header),
                Text('Sign in to your account', style: DefaultFont.body),
                const SizedBox(height: 28),

                /// EMAIL
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: formInputConstant(
                    prefixIconData: const Icon(Icons.email),
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email tidak boleh kosong.';
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Format email tidak valid.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                /// PASSWORD
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscured,
                  decoration: formInputConstant(
                    labelText: 'Password',
                    prefixIconData: const Icon(Icons.key),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong.';
                    }
                    if (value.length < 8) {
                      return 'Password minimal 8 karakter.';
                    }
                    return null;
                  },
                ),

                /// SHOW PASSWORD
                Row(
                  children: [
                    Checkbox(
                      value: !_isObscured,
                      onChanged: (_) {
                        setState(() => _isObscured = !_isObscured);
                      },
                    ),
                    const Text('Show Password'),
                  ],
                ),
                const SizedBox(height: 24),

                /// LOGIN BUTTON
                ElevatedButton(
                  style: AppButtonStyles.defaultButton(),
                  onPressed: _isLoading ? null : _handleLogin,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Sign in'),
                ),
                const SizedBox(height: 20),

                /// REGISTER
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (!_isLoading) {
                              context.pushReplacement(const RegisterUserT15());
                            }
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
