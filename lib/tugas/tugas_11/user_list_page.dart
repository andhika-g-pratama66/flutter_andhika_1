import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/database/sqflite.dart';
import 'package:flutter_andhika_1/model/user_model.dart';

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
      appBar: AppBar(),
      body: userData.isEmpty || userData == []
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),

                shrinkWrap: true,
                itemCount: userData.length,
                itemBuilder: (BuildContext context, int index) {
                  final items = userData[index];
                  return GridTile(
                    child: Column(
                      spacing: 8,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.person),
                            Text(
                              items.name,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [Icon(Icons.email), Text(items.email)],
                        ),
                        Row(
                          spacing: 8,
                          children: [Icon(Icons.phone), Text(items.phoneNum)],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.location_city),
                            Text(items.city),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
