import 'package:flutter/material.dart';

class FormTugas4 extends StatelessWidget {
  const FormTugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrasi Tanaman')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Nama Tanaman',
                    hint: Text(
                      'e.g., Wortel, Stroberi',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    hint: Text(
                      'e.g., Buah, Sayuran',
                      style: TextStyle(color: Colors.grey),
                    ),
                    labelText: 'Jenis Tanaman',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hint: Text(
                      'e.g., 1, 5',
                      style: TextStyle(color: Colors.grey),
                    ),
                    labelText: 'Jumlah Tanaman',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hint: Text(
                      'e.g., 25 x 25 cm',
                      style: TextStyle(color: Colors.grey),
                    ),

                    labelText: 'Ukuran Pot',
                  ),
                ),
                SizedBox(height: 32),
                Text('List Tanaman', style: TextStyle(fontSize: 24)),
                ListTile(
                  title: Text('Wortel'),
                  leading: Image.asset('assets/images/carrot.png'),
                  focusColor: Colors.green.shade50,
                  contentPadding: EdgeInsets.all(8),
                  subtitle: Text('Sayuran'),
                ),
                ListTile(
                  title: Text('Stroberi'),
                  subtitle: Text('Buah'),
                  leading: Image.asset('assets/images/fruit.png'),
                  contentPadding: EdgeInsets.all(8),
                ),
                ListTile(
                  title: Text('Dahlia'),
                  subtitle: Text('Bunga'),
                  leading: Image.asset('assets/images/flower.png'),
                  contentPadding: EdgeInsets.all(8),
                ),
                ListTile(
                  title: Text('Kaktus'),
                  subtitle: Text('Sukulen'),
                  leading: Image.asset('assets/images/succulent.png'),
                  contentPadding: EdgeInsets.all(8),
                ),
                ListTile(
                  title: Text('Mangga'),
                  subtitle: Text('Buah'),
                  leading: Image.asset('assets/images/mango.png'),
                  contentPadding: EdgeInsets.all(8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
