import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/constant/form_field_constant.dart';
import 'package:flutter_andhika_1/database/sqflite.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/model/user_model.dart';
import 'package:flutter_andhika_1/tugas/tugas_11/tugas11_screen.dart';

class UserListT11 extends StatefulWidget {
  const UserListT11({super.key});

  @override
  State<UserListT11> createState() => _UserListT11State();
}

class _UserListT11State extends State<UserListT11> {
  late List<UserModel> userData = [];
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    await Future.delayed(Duration(seconds: 2));
    userData = await DBHelper.getAllUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pushAndRemoveAll(Tugas11Screen());
          },
        ),
      ),
      body: userData.isEmpty || userData == []
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: userData.length,
                itemBuilder: (BuildContext context, int index) {
                  final items = userData[index];
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(items.name),
                    subtitle: Text(items.city),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await showEditDialog(context, items);
                            userData = await DBHelper.getAllUser();
                            setState(() {});
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            await showDeleteDialog(context, items.id!);
                            userData = await DBHelper.getAllUser();
                            setState(() {});
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }

  Future showEditDialog(BuildContext context, UserModel items) async {
    final nameController = TextEditingController(text: items.name);
    final cityController = TextEditingController(text: items.city);
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: formConstant(hintText: 'Nama'),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: cityController,
                decoration: formConstant(hintText: 'Kota'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await DBHelper.updateUser(
                  UserModel(
                    id: items.id,
                    name: nameController.text,
                    email: items.email,
                    phoneNum: items.phoneNum,
                    city: cityController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Data telah disimpan')));
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  Future showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Anda yakin ingin menghapus user ini ?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                context.pop(false);
              },
              child: Text('Batal'),
            ),

            ElevatedButton(
              onPressed: () async {
                context.pop(true);
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
    if (confirm == true) {
      await DBHelper.deleteUser(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Data berhasil dihapus')));
    }
  }
}
