import 'package:flutter/material.dart';
import 'tampil_data.dart';

class FormDataPage extends StatefulWidget {
  const FormDataPage({Key? key}) : super(key: key);

  @override
  State<FormDataPage> createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
  final _formKey = GlobalKey<FormState>();

  // Prefill sesuai info kamu: Ariza Nola Rufiana, H1D023005, 2004
  final _namaC = TextEditingController(text: 'Ariza Nola Rufiana');
  final _nimC = TextEditingController(text: 'H1D023005');
  final _tahunC = TextEditingController(text: '2004');

  @override
  void dispose() {
    _namaC.dispose();
    _nimC.dispose();
    _tahunC.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final nama = _namaC.text.trim();
      final nim = _nimC.text.trim();
      final tahun = int.parse(_tahunC.text.trim());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TampilDataPage(
            nama: nama,
            nim: nim,
            tahunLahir: tahun,
          ),
        ),
      );
    }
  }

  InputDecoration _dec(String label, [IconData? icon]) => InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Data')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // NAMA
                TextFormField(
                  controller: _namaC,
                  textInputAction: TextInputAction.next,
                  decoration: _dec('Nama', Icons.person),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Nama wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                // NIM
                TextFormField(
                  controller: _nimC,
                  textInputAction: TextInputAction.next,
                  decoration: _dec('NIM', Icons.badge),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'NIM wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                // TAHUN LAHIR
                TextFormField(
                  controller: _tahunC,
                  keyboardType: TextInputType.number,
                  decoration: _dec('Tahun Lahir', Icons.calendar_today),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Tahun lahir wajib diisi';
                    }
                    final parsed = int.tryParse(v);
                    final nowYear = DateTime.now().year;
                    if (parsed == null) return 'Tahun harus angka';
                    if (parsed < 1900 || parsed > nowYear) {
                      return 'Isi antara 1900–$nowYear';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
