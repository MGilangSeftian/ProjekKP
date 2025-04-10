import 'package:flutter/material.dart';

class TampilanForgotPassword extends StatefulWidget {
  const TampilanForgotPassword({super.key});

  @override
  State<TampilanForgotPassword> createState() => _TampilanForgotPasswordState();
}

class _TampilanForgotPasswordState extends State<TampilanForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forget Password",
          style: TextStyle(
              color: Colors.red,
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Masukkan email untuk reset password:",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const TextField(
                // controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // aksi reset password
                  },
                  child: Text("Reset Password",
                  style: TextStyle(color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
