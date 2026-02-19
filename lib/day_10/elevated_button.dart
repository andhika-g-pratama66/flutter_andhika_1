import 'package:flutter/material.dart';

class ElevatedButton10 extends StatelessWidget {
  const ElevatedButton10({super.key, this.onPressed, required this.text});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Saya $text');
      },
      child: Text(text),
    );
  }
}
