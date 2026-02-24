import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/checkbox.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/dark_mode.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/date_picker.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/dropdown.dart';
import 'package:flutter_andhika_1/tugas/tugas_7/time_picker.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  String _appBarTitle = "Home Page";
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
    CheckboxT7(),
    DarkMode(),
    DropdownProduct(),
    DatePickerT7(),
    TimePickerT7(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Center(child: Text('Hello'))),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text('Checkbox'),
              onTap: () {
                onTapItemDrawer(0);
                _changeTitle('Checkbox');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Switch'),
              onTap: () {
                onTapItemDrawer(1);
                _changeTitle('Switch');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text('Dropdown'),
              onTap: () {
                onTapItemDrawer(2);
                _changeTitle('Dropdown');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Date Picker'),
              onTap: () {
                onTapItemDrawer(3);
                _changeTitle('Date Picker');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Time Picker'),
              onTap: () {
                onTapItemDrawer(4);
                _changeTitle('Time Picker');
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
