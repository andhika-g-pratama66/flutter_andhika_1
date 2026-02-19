import 'package:flutter/material.dart';

class IconButton10 extends StatelessWidget {
  const IconButton10({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
