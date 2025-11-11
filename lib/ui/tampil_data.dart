import 'package:flutter/material.dart';

class TampilDataPage extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahunLahir;

  const TampilDataPage({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  int get umur {
    final nowYear = DateTime.now().year;
    return nowYear - tahunLahir;
    // Catatan: ini pendekatan sederhana (tanpa cek bulan/tanggal)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perkenalan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
