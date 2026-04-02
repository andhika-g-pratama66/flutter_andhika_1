import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/constants/button_style.dart';
import 'package:flutter_andhika_1/constants/default_font.dart';
import 'package:flutter_andhika_1/constants/form_decoration.dart';
import 'package:flutter_andhika_1/database/preference.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/extension/validator_helper.dart';

import 'package:flutter_andhika_1/tugas/tugas_15/api/register_api.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/login.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/profile.dart';

class RegisterUserT15 extends StatefulWidget {
  const RegisterUserT15({super.key});

  @override
  State<RegisterUserT15> createState() => _RegisterUserT15State();
}

class _RegisterUserT15State extends State<RegisterUserT15> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passConfirmController = TextEditingController();
  bool _isLoading = false;
  bool _isObscured = true;
  bool _isObscured2 = true;
  final _validator = ValidatorHelper();
  @override
  void dispose() {
    // ← selalu dispose controller
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passConfirmController.dispose();
    super.dispose();
  }

  void _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      final register = await registerUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      await PrefsHandler.storingToken(register?.data?.token ?? "");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(register?.message ?? 'Register berhasil!'),
          backgroundColor: Colors.green,
        ),
      );

      context.pushReplacement(MyProfile());
    } on ApiException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red),
      );

      // Only navigate away if it's NOT a 422 (duplicate email / validation error)
      if (e.statusCode != 422) {
        // stays on page for all errors, so nothing extra needed here
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan, coba lagi.'),
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text('Create Account', style: DefaultFont.header),
                SizedBox(height: 48),
                TextFormField(
                  controller: _nameController,
                  validator: (value) => _validator.validateName(value),
                  decoration: formInputConstant(
                    labelText: 'Full Name',
                    prefixIconData: Icon(Icons.person_2_outlined),
                  ),
                ),
                SizedBox(height: 20),

                TextFormField(
                  controller: _emailController,
                  validator: (value) => _validator.validateEmail(value),
                  decoration: formInputConstant(
                    labelText: 'Email Address',
                    prefixIconData: Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) => _validator.validatePassword(value),
                  obscureText: _isObscured,
                  decoration: formInputConstant(
                    labelText: 'Password',
                    prefixIconData: Icon(Icons.lock_outline_rounded),
                    suffixIconData: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: _isObscured
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passConfirmController,

                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Password do not match';
                    }
                    return null;
                  },
                  obscureText: _isObscured2,
                  decoration: formInputConstant(
                    labelText: 'Confirm Password',
                    prefixIconData: Icon(Icons.lock_outline_rounded),
                    suffixIconData: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured2 = !_isObscured2;
                        });
                      },
                      icon: _isObscured2
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : _handleRegister, // ← disabled saat loading
                  style: AppButtonStyles.defaultButton(),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Create Account'),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushReplacement(LoginUserT15());
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
