import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),

      child: Column(
        children: [
          Text('Tentang GreenThumb', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Text(
            'Asisten Pribadi untuk Kebun yang Lebih Hijau dan Produktif ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Pernah lupa kapan terakhir kali memberi pupuk? Atau bingung kenapa daun tanaman hiasmu tiba-tiba menguning? GreenThumb hadir sebagai solusi cerdas bagi para pecinta tanaman, mulai dari pemula urban farming hingga pekebun berpengalaman.',
          ),
          SizedBox(height: 56),
          Text(
            'Mengapa Memilih GreenThumb?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('Smart Scheduling'),
          ),
          ListTile(
            leading: Icon(Icons.monitor_heart_outlined),
            title: Text('Monitoring Kesehatan Tanaman'),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Identifikasi hama dan Penyakit'),
          ),
          ListTile(
            leading: Icon(Icons.sunny),
            title: Text('Integrasi dengan Cuaca Lokal'),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Ensiklopedia Tanaman'),
          ),
        ],
      ),
    );
  }
}
