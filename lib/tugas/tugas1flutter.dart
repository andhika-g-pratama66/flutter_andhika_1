import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Saya'),
        backgroundColor: Colors.deepOrange,

        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Column(
            children: [
              Text(
                'Nama: Andhika Gama Pratama',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Icon(Icons.location_on), Text('Jakarta')],
          ),
          Column(children: [Text('Seseorang yang sedang mempelajari Flutter')]),
        ],
      ),
    );
  }
}
