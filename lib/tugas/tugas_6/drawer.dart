import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/home.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _HomePageState();
}

class _HomePageState extends State<DrawerPage> {
  int selectedIndex = 0;
  void onTapItemDrawer(int index) {
    selectedIndex = index;
    setState(() {});
  }

  static const List<Widget> widgetOptions = <Widget>[
    Home(),
    Text('Index 1: Search'),
    Text('Index 2: Setting'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('helo')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                onTapItemDrawer(0);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Center(child: widgetOptions.elementAt(selectedIndex)),

      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(size: 32),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: selectedIndex,
        onTap: onTapItemDrawer,
      ),
    );
  }
}
