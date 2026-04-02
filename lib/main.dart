import 'package:flutter/material.dart';
// import 'package:flutter_andhika_1/day_10/latihan_3.dart';
import 'package:flutter_andhika_1/day_14/day_14_screen.dart';
import 'package:flutter_andhika_1/tugas/tugas_10/registration.dart';
import 'package:flutter_andhika_1/tugas/tugas_11/tugas11_screen.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/home.dart';
import 'package:flutter_andhika_1/tugas/tugas_14/view/tugas_14_screen.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/login.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/profile.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/register.dart';

import 'package:flutter_andhika_1/tugas/tugas_6/login_page.dart';
import 'package:flutter_andhika_1/tugas/tugas_9/tugas_9_screen.dart';

// import 'package:flutter/rendering.dart';

// import 'package:flutter_andhika_1/tugas/tugas2/tugas_2.dart';
// import 'package:flutter_andhika_1/day_5/scaffold.dart';
// import 'package:flutter_andhika_1/tugas/tugas1flutter.dart';

void main() {
  // debugPaintSizeEnabled = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Optional: hides the debug banner
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black87,
          brightness: Brightness.dark,
        ),
      ),
      home: const LoginUserT15(),
    );
  }
}
