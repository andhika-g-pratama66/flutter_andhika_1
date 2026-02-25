import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_9/data/daftar_tanaman.dart';

class ModelTugas9 extends StatefulWidget {
  const ModelTugas9({super.key});

  @override
  State<ModelTugas9> createState() => _ModelTugas9State();
}

class _ModelTugas9State extends State<ModelTugas9> {
  @override
  Widget build(BuildContext context) {
    final data = daftarTanaman;
    data.sort((a, b) => (a.nama ?? "").compareTo(b.nama ?? ""));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: daftarTanaman.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(data[index].nama ?? ''),
            subtitle: Text(data[index].kategori ?? ""),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index].imgUrl ?? ""),
            ),
          );
        },
      ),
    );
  }
}
