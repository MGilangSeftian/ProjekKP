import 'package:flutter/material.dart';

class TampilanHomePengguna extends StatefulWidget {
  const TampilanHomePengguna({super.key});

  @override
  State<TampilanHomePengguna> createState() => _TampilanHomePenggunaState();
}

class _TampilanHomePenggunaState extends State<TampilanHomePengguna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tampilan Home GTM"),
      ),
    );
  }
}
