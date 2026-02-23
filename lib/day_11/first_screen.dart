import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_11/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Day 11'), centerTitle: true),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPageDay11()),
              );
            },
            child: Text('Next Page'),
          ),
        ],
      ),
    );
  }
}
