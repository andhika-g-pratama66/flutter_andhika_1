import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/tugas/tugas_10/home_tugas_10.dart';
import 'package:flutter_andhika_1/tugas/tugas_10/login_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/drawer.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/login_page.dart';

class RegisterPageTugas10 extends StatefulWidget {
  const RegisterPageTugas10({super.key});

  @override
  State<RegisterPageTugas10> createState() => _RegisterPageTugas10State();
}

class _RegisterPageTugas10State extends State<RegisterPageTugas10> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
          margin: EdgeInsets.only(bottom: 32),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Buat Akun', style: TextStyle(fontSize: 24)),
                RichText(
                  text: TextSpan(
                    text: "Sudah punya akun?",
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
                                builder: (context) => const LoginPageTugas10(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Nama',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama harus diisi';
                    }
                    String pattern = r'^[a-zA-Z\s]+$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Harap masukkan nama dengan benar';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    labelText: 'Nama Lengkap',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Nomor Telepon (Opsional)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                TextFormField(
                  controller: noHPController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return null;
                    }
                    String pattern = r'^[0-9]{3,32}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Harap masukkan nomor telepon yang benar';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    labelText: 'Nomor telepon',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Alamat Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!value.contains('@')) {
                      return 'Harap masukkan alamat email yang valid ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    labelText: 'Masukkan alamat email',
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password harus diisi';
                    }
                    String pattern =
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$';
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      return 'Password harus mengandung minimal 6 karakter, 1 huruf besar, dan satu tanda baca (misalnya ! dan %) ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    labelText: 'Masukkan password',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Konfirmasi Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                TextFormField(
                  obscureText: true,
                  controller: confirmPassController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password harap diisi';
                    }
                    if (value != passwordController.text) {
                      return 'Password tidak cocok, harap coba lagi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    labelText: 'Masukkan password',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 46),
                    backgroundColor: Colors.green.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(18),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text('Syarat & Ketentuan'),
                            content: RichText(
                              text: TextSpan(
                                text: "Syarat & Ketentuan dapat anda lihat ",
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'di sini',
                                    style: TextStyle(
                                      color: Colors.orange.shade700,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Page TnC');
                                      },
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red.shade700,
                                      ),
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: Text(
                                        'Tidak setuju',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green.shade700,
                                      ),
                                      onPressed: () {
                                        context.push(
                                          HomeTugas10(
                                            text: nameController.text,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Saya setuju',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Daftar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
