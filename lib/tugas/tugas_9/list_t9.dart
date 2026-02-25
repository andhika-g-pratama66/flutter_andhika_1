import 'package:flutter/material.dart';

class ListTugas9 extends StatelessWidget {
  ListTugas9({super.key});
  final List<String> kategoriTanaman = [
    'Buah-buahan',
    'Sayuran',
    'Sukulen',
    'Bunga',
    'Herbal',
    'Tanaman Hias',
    'Pohon',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategoriTanaman.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ListTile(title: Text(kategoriTanaman[index])),
        );
      },
    );
  }
}
