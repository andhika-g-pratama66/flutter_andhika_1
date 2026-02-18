import 'package:flutter/material.dart';

class StackDay8 extends StatelessWidget {
  const StackDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildStack(),
        buildStack(),
        buildStack(),
        buildStack(),
        buildStack(),
        buildStack(),
      ],
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: AlignmentGeometry.centerLeft,

      clipBehavior: Clip.none,
      children: [
        Container(color: Colors.blue, height: 400, width: 400),
        Container(color: Colors.red, height: 300, width: 350),
        Container(color: Colors.green, height: 200, width: 300),
        Positioned(
          // left: 20,
          child: Row(
            children: [
              Container(color: Colors.white, height: 75, width: 250),
              Container(height: 75, width: 100, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}
