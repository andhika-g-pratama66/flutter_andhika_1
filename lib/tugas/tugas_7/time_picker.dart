import 'package:flutter/material.dart';

class TimePickerT7 extends StatefulWidget {
  const TimePickerT7({super.key});

  @override
  State<TimePickerT7> createState() => _TimePickerT7State();
}

class _TimePickerT7State extends State<TimePickerT7> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text('Pilih Jam'),
        ),
        Text(
          selectedTime != null
              ? "Selected Time:   ${selectedTime?.hour}:${selectedTime?.minute}"
              : 'SIlahkan pilih waktu',
        ),
      ],
    );
  }
}
