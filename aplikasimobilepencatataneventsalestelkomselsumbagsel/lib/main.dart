// import 'package:aplikasimobilepencatataneventsalestelkomselsumbagsel/screens/supervisor/TampilanHome.dart';
import 'package:aplikasimobilepencatataneventsalestelkomselsumbagsel/screens/TampilanForgotPassword.dart';
import 'package:aplikasimobilepencatataneventsalestelkomselsumbagsel/screens/TampilanLogin.dart';
import 'package:aplikasimobilepencatataneventsalestelkomselsumbagsel/screens/TampilanRegister.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/TampilanLogin',
      routes: {
        '/TampilanLogin': (context) => const TampilanLogin(),
        '/TampilanRegister': (context) => const TampilanRegister(),
        '/TampilanForgotPassword' : (context) => const TampilanForgotPassword(),
      },
    );
  }
}
