import 'package:flutter/material.dart';
import 'ui/form_data.dart';

void main() {
  runApp(const NIMTugas6App());
}

class NIMTugas6App extends StatelessWidget {
  const NIMTugas6App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIM_Tugas6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const FormDataPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
