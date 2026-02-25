import 'package:flutter/material.dart';

class Day14Screen extends StatelessWidget {
  Day14Screen({super.key});
  final List<String> dataProduk = ['Apple', 'Samsung', 'Xiami', 'Asus', 'Acer'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: dataProduk.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Index ke $index : ${dataProduk[index]}'),
          );
        },
      ),
    );
  }
}
