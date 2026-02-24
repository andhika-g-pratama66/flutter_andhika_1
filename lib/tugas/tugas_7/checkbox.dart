import 'package:flutter/material.dart';

class CheckboxT7 extends StatefulWidget {
  const CheckboxT7({super.key});

  @override
  State<CheckboxT7> createState() => _CheckboxT7State();
}

class _CheckboxT7State extends State<CheckboxT7> {
  bool _isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Syarat dan Ketentuan', style: TextStyle(fontSize: 20)),
        Row(
          children: [
            Checkbox(
              value: _isAgreed,
              onChanged: (value) {
                setState(() {
                  _isAgreed = value!;
                });
              },
            ),
            Text('Saya menyetujui semua persyaratan yang berlaku'),
          ],
        ),
        Text(
          _isAgreed
              ? 'Lanjutkan pendaftaran diperbolehkan'
              : 'Anda belum bisa melanjutkan',
        ),
      ],
    );
  }
}
