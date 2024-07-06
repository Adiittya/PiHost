import 'package:flutter/material.dart';
import 'package:pihost/pages/add_pi/add_pi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PiHost',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF212121),),
        useMaterial3: true,
      ),
      home:  AddPi(),
    );
  }
}