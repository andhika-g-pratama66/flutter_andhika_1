import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_6/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void onTapItem(int index) {
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
        onTap: onTapItem,
      ),
    );
  }
}
