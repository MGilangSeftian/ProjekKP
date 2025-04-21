import 'package:flutter/material.dart';

class TampilanHomeAdmin extends StatefulWidget {
  const TampilanHomeAdmin({super.key});

  @override
  State<TampilanHomeAdmin> createState() => _TampilanHomeAdminState();
}

class _TampilanHomeAdminState extends State<TampilanHomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tampilan Home admin"),
      ),
    );
  }
}
