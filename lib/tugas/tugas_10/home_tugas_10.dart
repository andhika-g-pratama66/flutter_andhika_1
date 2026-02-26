import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/login_page.dart';

class HomeTugas10 extends StatelessWidget {
  const HomeTugas10({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(child: Text('Selamat datang, $text')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
