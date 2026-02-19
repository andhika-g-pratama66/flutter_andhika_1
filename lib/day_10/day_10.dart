import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_10/latihan_1.dart';
import 'package:flutter_andhika_1/day_10/latihan_3.dart';
import 'package:flutter_andhika_1/day_10/latihan_2.dart';

class Day10Screen extends StatefulWidget {
  const Day10Screen({super.key});

  @override
  State<Day10Screen> createState() => _Day10ScreenState();
}

class _Day10ScreenState extends State<Day10Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // child: Icon(icon),
      ),
      appBar: AppBar(title: Text('Day 10')),
      body: ListView(
        children: [
          Latihan1(),
          // Latihan2()
          LoginPage(),
        ],
      ),
    );
  }
}
