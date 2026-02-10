import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/day_5/column.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GrowTia'),
        backgroundColor: const Color.fromARGB(153, 246, 48, 73),
        centerTitle: true,
        leading: BackButton(),
        actions: [Text("PPKD Jakarta Pusat")],
      ),
      body: Column(
        children: [
          ColumnDay5(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text('Menu 1'), Text('Menu 2')],
          ),
        ],
      ),

      // backgroundColor: Colors.green,
    );
  }
}
