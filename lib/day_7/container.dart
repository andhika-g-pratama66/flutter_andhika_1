import 'package:flutter/material.dart';

class ContainerDay7 extends StatelessWidget {
  const ContainerDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(16),
        // backgroundBlendMode: BlendMode.lighten,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(12, 12),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Image(image: AssetImage('assets/images/avatar.png'), height: 84),
          Icon(Icons.chair, size: 64),
          Column(
            children: [
              Text('The Special'),
              Text('Offer Up to', style: TextStyle()),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '30%'),
                    TextSpan(text: 'off'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(children: [Text('Shop now')]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
