import 'package:flutter/material.dart';

class DeskripsiTanaman extends StatelessWidget {
  const DeskripsiTanaman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'Panduan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF005F02),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            //Cabai
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 32, right: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(70),
                        child: Image.asset(
                          'assets/images/cabai_rawit.webp',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 32, left: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(70),
                        child: Image.asset(
                          'assets/images/cabai_rawit2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Center(
              child: Text(
                'Cabai Rawit',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
            ),
            Text(
              'Capsicum frutescens',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Deskripsi:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Cabai rawit adalah tanaman yang cocok untuk kebun rumah atau balkon karena tidak membutuhkan lahan luas. Tanaman ini membutuhkan sinar matahari penuh dan penyiraman rutin. Cabai rawit dapat mulai dipanen dalam waktu 70–90 hari setelah tanam.',
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 40),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 175, 238, 175),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.sunny, color: Colors.orange),
                          SizedBox(width: 12),
                          Text(
                            'Kebutuhan Cahaya: Tinggi(6-8 jam/ hari)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.water_drop, color: Colors.blue),
                          SizedBox(width: 12),
                          Text(
                            'Kebutuhan Air: Sedang (1x Sehari)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.thermostat, color: Colors.red),
                          SizedBox(width: 12),
                          Text(
                            'Suhu Ideal: 24–32°C',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.hourglass_bottom_outlined),
                          SizedBox(width: 12),
                          Text(
                            'Masa Panen: 70-90 hari',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
