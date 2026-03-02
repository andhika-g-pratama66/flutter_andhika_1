import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/constant/form_field_constant.dart';
import 'package:flutter_andhika_1/database/sqflite.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/model/user_model.dart';
import 'package:flutter_andhika_1/tugas/tugas_11/user_list_page.dart';

class Tugas11Screen extends StatefulWidget {
  const Tugas11Screen({super.key});

  @override
  State<Tugas11Screen> createState() => _Tugas11ScreenState();
}

class _Tugas11ScreenState extends State<Tugas11Screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Text('Pendaftaran', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 20),

                ///nama
                TextFormField(
                  decoration: formConstant(hintText: 'Nama Lengkap'),
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
                ),
                SizedBox(height: 16),

                ///email
                TextFormField(
                  decoration: formConstant(hintText: 'Alamat Email'),
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!value.contains('@')) {
                      return 'Harap masukkan alamat email yang valid ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                ///Nomor HP
                TextFormField(
                  decoration: formConstant(hintText: 'Nomor HP'),
                  controller: phoneNumController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nomor HP harus diisi';
                    }
                    String pattern = r'^[0-9]{3,32}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Harap masukkan nomor telepon yang benar';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 16),

                ///Asal Kota
                TextFormField(
                  decoration: formConstant(hintText: 'Asal Kota'),
                  controller: cityController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Asal kota harus diisi';
                    }
                    String pattern = r'^[a-zA-Z\s]+$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Harap masukkan nama kota dengan benar';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Mohon Lengkapi Data')),
                        );
                        return;
                      }
                      DBHelper.registerUser(
                        UserModel(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNum: phoneNumController.text,
                          city: cityController.text,
                        ),
                      );
                      nameController.clear();
                      emailController.clear();
                      phoneNumController.clear();
                      cityController.clear();
                      setState(() {});
                    },
                    child: Text('Daftar'),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(UserListT11());
                    },
                    child: Text('Lihat List User'),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Daftar User',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                userWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<UserModel>> userWidget() {
    return FutureBuilder<List<UserModel>>(
      future: DBHelper.getAllUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final userData = snapshot.data as List<UserModel>;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: userData.length,
          itemBuilder: (BuildContext context, int index) {
            final items = userData[index];
            return Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),

                  title: Text(items.name),
                  subtitle: Text(items.city),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
