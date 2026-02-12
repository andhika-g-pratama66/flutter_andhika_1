import 'package:flutter/material.dart';

class SizedBox7 extends StatelessWidget {
  const SizedBox7({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ///versi coulumn
        Text("PPKD BATCH 1 2026"),
        SizedBox(height: 24),
        Text("Asik"),
        SizedBox(height: 24),

        ///Versi Row
        Row(
          children: [
            Text('Hello'),
            SizedBox(width: 24),
            Text('World'),
            SizedBox(width: 24),
            Text('Hello'),
            SizedBox(width: 24),
            Text('World'),
          ],
        ),
      ],
    );
  }
}
