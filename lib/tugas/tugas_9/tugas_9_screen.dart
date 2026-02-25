import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_9/list_map_t9.dart';
import 'package:flutter_andhika_1/tugas/tugas_9/list_t9.dart';
import 'package:flutter_andhika_1/tugas/tugas_9/model_t9.dart';

class Tugas9Screen extends StatefulWidget {
  const Tugas9Screen({super.key});

  @override
  State<Tugas9Screen> createState() => _Tugas9ScreenState();
}

class _Tugas9ScreenState extends State<Tugas9Screen> {
  int selectedIndex = 0;
  String _appBarTitle = 'Homepage';
  void onTapItemDrawer(int index) {
    selectedIndex = index;
    setState(() {});
  }

  void _changeTitle(String newTitle) {
    setState(() {
      _appBarTitle = newTitle;
    });
  }

  static List<Widget> widgetOptions = <Widget>[
    Text('HOMEPAGE'),
    ListTugas9(),
    ListMapTugas9(),
    ModelTugas9(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Icon(Icons.sunny)),
            ListTile(
              title: Text('Kategori Tanaman '),
              leading: Icon(Icons.list),
              onTap: () {
                onTapItemDrawer(1);
                _changeTitle('Kategori Tanaman (List)');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text('Daftar Tanaman (List Map)'),
              onTap: () {
                onTapItemDrawer(2);
                _changeTitle('Daftar Tanaman(List Map)');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.abc),
              title: Text('Daftar Tanaman Berdasarkan Alfabet (Model)'),
              onTap: () {
                onTapItemDrawer(3);
                _changeTitle('Daftar Tanaman (Model)');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
    );
  }
}
