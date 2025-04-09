// import 'package:aplikasimobilepencatataneventsalestelkomselsumbagsel/screens/supervisor/TampilanHome.dart';
import 'package:aplikasimobilepencatataneventsalestelkomselsumbagsel/screens/TampilanLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mobile Pencatatan Event Sales Telkomsel Sumbagsel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const TampilanHomeSupervisor(),
      home: const TampilanLogin(),
    );
  }
}
