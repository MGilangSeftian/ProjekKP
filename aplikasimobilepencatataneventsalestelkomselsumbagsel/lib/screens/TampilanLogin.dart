import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TampilanLogin extends StatefulWidget {
  const TampilanLogin({super.key});

  @override
  State<TampilanLogin> createState() => _TampilanLoginState();
}

class _TampilanLoginState extends State<TampilanLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/logo_telkomsel.png",
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Detail Login",
                style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: "Lupa Password?",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/HalamanResetPassword');
                      },
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                  text: "Belum Punya Akun? ",
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                  children: [
                    TextSpan(
                      text: "Daftar di sini",
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        decoration: TextDecoration.none,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/TampilanRegister');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
