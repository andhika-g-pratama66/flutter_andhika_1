import 'package:flutter/material.dart';

class ImagesDay7 extends StatelessWidget {
  const ImagesDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),

      child: Column(
        children: [
          // Text('Avatar', style: TextStyle(fontSize: 16)),
          Image.asset("assets/images/avatarblue.jpg"),
        ],
      ),
    );
  }
}
