import 'package:flutter/material.dart';

class Tugas5Screen extends StatefulWidget {
  const Tugas5Screen({super.key});

  @override
  State<Tugas5Screen> createState() => _Tugas5ScreenState();
}

class _Tugas5ScreenState extends State<Tugas5Screen> {
  bool showButton = false;
  bool showDescription = false;
  bool showPanduan = false;
  bool myFavorite = false;
  int counter = 0;
  void toggleFavorite() {
    setState(() {
      myFavorite = !myFavorite;
    });
  }

  //function untuk toggle state description
  void toggleDescription() {
    setState(() {
      showDescription = !showDescription;
    });
  }

  void togglePanduan() {
    setState(() {
      showPanduan = !showPanduan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tugas 5')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          counter--;
          setState(() {});
        },
        splashColor: Colors.green.shade200,
        child: Icon(Icons.exposure_minus_1),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          //Tittle
          Text(
            'List Tanaman',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          //ListTile ketika deskripsi tidak muncul
          if (!showButton)
            InkWell(
              splashColor: Colors.green.shade100,
              onTap: () {
                setState(() {
                  // print('Inkwell Disentuh');
                });
                showButton = !showButton;
              },
              child: ListTile(
                title: Text('Cabai Rawit'),
                leading: Image.asset('assets/images/cabai_rawit_3.jpg'),

                contentPadding: EdgeInsets.all(8),
                subtitle: Text('Sayuran'),
                trailing: IconButton(
                  color: Colors.red,
                  icon: Icon(
                    !myFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    setState(() {
                      toggleFavorite();
                      // print('IconButton Disentuh');
                    });
                  },
                ),
              ),
            ),

          //ListTile saat deskripsi muncul
          if (showButton)
            InkWell(
              splashColor: Colors.green.shade100,

              onTap: () {
                setState(() {
                  // print('Inkwell Disentuh');
                });
                showDescription = false;
                showPanduan = false;
                showButton = !showButton;
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text('Cabai Rawit'),
                    leading: Image.asset('assets/images/cabai_rawit_3.jpg'),

                    contentPadding: EdgeInsets.all(8),
                    subtitle: Text('Sayuran'),
                    trailing: IconButton(
                      color: Colors.red,
                      icon: Icon(
                        !myFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      onPressed: () {
                        setState(() {
                          toggleFavorite();
                          // print('IconButton Disentuh');
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          toggleDescription();
                          showPanduan = false;
                          setState(() {
                            // print('TextButton di klik');
                          });
                        },
                        child: Text('Deskripsi'),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // print('ElevatedButton di Klik');
                            togglePanduan();
                            showDescription = false;
                          });
                        },
                        child: Text('Panduan Tanam'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (showDescription)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Cabai rawit adalah tanaman yang cocok untuk kebun rumah atau balkon karena tidak membutuhkan lahan luas. Tanaman ini membutuhkan sinar matahari penuh dan penyiraman rutin. Cabai rawit dapat mulai dipanen dalam waktu 70–90 hari setelah tanam.',
              ),
            ),
          if (showPanduan)
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 100),
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

          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    counter++;
                    setState(() {});
                  },
                  onDoubleTap: () {
                    counter += 2;
                    setState(() {});
                  },
                  onLongPress: () {
                    counter += 3;
                    setState(() {});
                  },
                  child: Text(
                    counter.toString(),
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
