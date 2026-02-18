import 'package:flutter/material.dart';

class MyFormTugas3 extends StatelessWidget {
  const MyFormTugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              Text('Tambahkan Tanaman', style: TextStyle(fontSize: 20)),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Tanaman'),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      alignLabelWithHint: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'e.g., Tomat, Jeruk, dan Bunga Matahari',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Waktu Menanam'),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'e.g., 29 Januari 2026',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jumlah Tanaman'),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'e.g., 5',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ukuran Pot'),
                  SizedBox(height: 12),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'e.g., 25 x 25 cm',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 64),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis Tanaman',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Container(margin: EdgeInsets.all(16), child: gridNewPlant()),
            ],
          ),
        ),
      ),
    );
  }

  GridView gridNewPlant() => GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),

    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [Image.asset('assets/images/carrot.png', height: 100)],
            ),
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,

              children: [
                Text(
                  'Sayuran',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [Image.asset('assets/images/fruit.png', height: 100)],
            ),
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,

              children: [
                Text(
                  'Buah',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [Image.asset('assets/images/herb.png', height: 100)],
            ),
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,

              children: [
                Text(
                  'Herbal',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [Image.asset('assets/images/flower.png', height: 100)],
            ),
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,

              children: [
                Text(
                  'Bunga',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset('assets/images/succulent.png', height: 100),
              ],
            ),
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,

              children: [
                Text(
                  'Sukulen',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [Image.asset('assets/images/tree.png', height: 100)],
            ),
            Spacer(),
            Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,

              children: [
                Text(
                  'Pohon',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
