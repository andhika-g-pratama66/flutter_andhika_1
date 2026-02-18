import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_8/stack.dart';

class Day8Screen extends StatelessWidget {
  const Day8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day8'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return StackDay8();
        },
      ),
    );
  }

  ListView buildSingleChild() {
    return ListView(
      children: [
        Column(children: [StackDay8()]),
      ],
    );
  }
}
