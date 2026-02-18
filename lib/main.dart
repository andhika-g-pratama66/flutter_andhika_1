import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_7/day_7.dart';
import 'package:flutter_andhika_1/day_8/day_8.dart';
import 'package:flutter_andhika_1/practice/home.dart';
import 'package:flutter_andhika_1/tugas/tugas3flutter.dart';
import 'package:flutter_andhika_1/tugas/tugas4flutter.dart';
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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(181, 38, 155, 3),
        ),
      ),
      //home: MyProfile()

      // home: Day7Screen(),
      // home: Day8Screen(),
      // home: DeskripsiTanaman(),
      // home: MyHomePage(),
      // home: MyFormTugas3(),
      home: FormTugas4(),
    );
  }
}
