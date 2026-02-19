import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_10/icon_button.dart';

class Latihan1 extends StatefulWidget {
  const Latihan1({super.key});

  @override
  State<Latihan1> createState() => _Latihan1State();
}

class _Latihan1State extends State<Latihan1> {
  int counter = 0;

  void increment() {
    counter++;
    setState(() {});
  }

  void decrement() {
    counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(counter.toString(), style: TextStyle(fontSize: 50)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                increment();
              },
              child: Text('Tambah'),
            ),
            TextButton(
              onPressed: () {
                decrement();
              },
              child: Text('Kurang'),
            ),
            TextButton(
              onPressed: () {
                counter = 0;
                // print('Nilai dari Counter: $counter');
                setState(() {});
              },
              child: Text('Reset'),
            ),

            IconButton10(icon: Icon(Icons.plus_one), onPressed: increment),
            IconButton10(
              icon: Icon(Icons.exposure_minus_1),
              onPressed: decrement,
            ),
          ],
        ),
      ],
    );
  }
}
