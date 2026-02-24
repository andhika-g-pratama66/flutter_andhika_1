import 'package:flutter/material.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          thumbIcon: WidgetStatePropertyAll(
            _isOn ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
          ),

          value: _isOn,
          onChanged: (value) {
            setState(() {
              _isOn = value;
            });
          },
        ),
        Container(
          color: _isOn ? Colors.black : Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 500,
        ),
      ],
    );
  }
}
