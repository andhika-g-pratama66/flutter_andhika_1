import 'package:flutter/material.dart';

class DatePickerT7 extends StatefulWidget {
  const DatePickerT7({super.key});

  @override
  State<DatePickerT7> createState() => _DatePickerT7State();
}

class _DatePickerT7State extends State<DatePickerT7> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              locale: const Locale('en', ''),
            );
            if (picked != null) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
          label: Text('Pick a Date'),
        ),
        Text(
          selectedDate != null
              ? "Selected Date: $selectedDate "
              : 'Silahkan Pilih Tanggal',
        ),
      ],
    );
  }
}
