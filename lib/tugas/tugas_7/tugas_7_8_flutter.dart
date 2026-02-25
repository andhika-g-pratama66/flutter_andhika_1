import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/about_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/checkbox.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/dark_mode.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/date_picker.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/dropdown.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/home_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/time_picker.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  String _appBarTitle = "Home";
  int selectedIndex = 0;

  void onTapItemDrawer(int index) {
    selectedIndex = index;
    setState(() {});
  }

  void _changeTitle(String newTitle) {
    setState(() {
      _appBarTitle = newTitle; // Update the state and trigger a rebuild
    });
  }

  static const List<Widget> widgetOptions = <Widget>[
    HomePageT7(),
    CheckboxT7(),
    DarkMode(),
    DropdownProduct(),
    DatePickerT7(),
    TimePickerT7(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    bool showDrawer = selectedIndex != 6;
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),

      drawer: showDrawer
          ? Drawer(
              child: ListView(
                children: [
                  DrawerHeader(child: Center(child: Text('Tugas7'))),

                  ListTile(
                    leading: Icon(Icons.check_box),
                    title: Text('Checkbox'),
                    onTap: () {
                      onTapItemDrawer(1);
                      _changeTitle('Checkbox');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: Text('Switch'),
                    onTap: () {
                      onTapItemDrawer(2);
                      _changeTitle('Switch');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down),
                    title: Text('Dropdown'),
                    onTap: () {
                      onTapItemDrawer(3);
                      _changeTitle('Dropdown');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month),
                    title: Text('Date Picker'),
                    onTap: () {
                      onTapItemDrawer(4);
                      _changeTitle('Date Picker');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.timer),
                    title: Text('Time Picker'),
                    onTap: () {
                      onTapItemDrawer(5);
                      _changeTitle('Time Picker');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex == 6 ? 1 : 0,
        onTap: (value) {
          if (value == 0) {
            onTapItemDrawer(0);
            _changeTitle('Home');
          } else {
            onTapItemDrawer(6);
            _changeTitle('About Us');
          }
        },
      ),
    );
  }
}
