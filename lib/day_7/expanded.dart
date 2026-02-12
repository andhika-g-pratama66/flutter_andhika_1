import 'package:flutter/material.dart';

class ExpandedDay7 extends StatelessWidget {
  const ExpandedDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(4),
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
