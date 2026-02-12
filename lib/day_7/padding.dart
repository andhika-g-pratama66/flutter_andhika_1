import 'package:flutter/material.dart';

class PaddingDay7 extends StatelessWidget {
  const PaddingDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.red,
        child: Column(children: [Text('Saya'), Text('Saya'), Text('Saya')]),
      ),
    );
  }
}
