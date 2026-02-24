import 'package:flutter/material.dart';

class DropdownProduct extends StatefulWidget {
  const DropdownProduct({super.key});

  @override
  State<DropdownProduct> createState() => _DropdownProductState();
}

class _DropdownProductState extends State<DropdownProduct> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Pilih Kategori Produk', style: TextStyle(fontSize: 20)),
        DropdownButton<String>(
          value: selected,

          hint: Text('Produk'),
          items: ['Elektronik', 'Pakaian', 'Makanan', 'Minuman'].map((
            String val,
          ) {
            return DropdownMenuItem(value: val, child: Text(val));
          }).toList(),
          onChanged: (value) {
            setState(() {
              selected = value;
            });
          },
        ),
        Text(
          selected != null
              ? 'Anda memilih kategori: $selected'
              : 'Silahkan pilih kategori produk',
        ),
      ],
    );
  }
}
