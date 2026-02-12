import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_7/container.dart';
import 'package:flutter_andhika_1/day_7/expanded.dart';
import 'package:flutter_andhika_1/day_7/images.dart';
// import 'package:flutter_andhika_1/day_7/padding.dart';
// import 'package:flutter_andhika_1/day_7/sizedbox.dart';

class Day7Screen extends StatelessWidget {
  const Day7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day7'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Column(
        children: [
          // SizedBox7(),
          // PaddingDay7(),
          ContainerDay7(),
          ImagesDay7(),
          ExpandedDay7(),
        ],
      ),
    );
  }
}
