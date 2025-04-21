import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';

class TampilanLogin extends StatefulWidget {
  const TampilanLogin({super.key});

  @override
  State<TampilanLogin> createState() => _TampilanLoginState();
}

class _TampilanLoginState extends State<TampilanLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String? _errorMessage; // Tambahan: untuk menyimpan pesan error

  @override
  void initState() {
    super.initState();
    _usernameController.clear();
    _passwordController.clear();
  }

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Username dan password wajib diisi.";
      });
      return;
    }

    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:8080/api_telkom/login.php'),
        body: {
          'username': username,
          'password': password,
        },
      );

      var result = jsonDecode(response.body);

      if (result['status'] == 'success') {
        _usernameController.clear();
        _passwordController.clear();
        setState(() {
          _errorMessage = null; // Clear error jika login berhasil
        });
        Navigator.pushReplacementNamed(context, '/TampilanPengguna');
      } else {
        setState(() {
          _errorMessage = result['message'];
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Terjadi kesalahan saat menghubungi server.";
      });
    }
  }

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
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
              const SizedBox(height: 20),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _usernameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: const Icon(Icons.person, color: Colors.red),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock, color: Colors.red),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: "Forgot Password?",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/TampilanForgotPassword');
                      },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Tampilan Error Message
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _login,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                  children: [
                    TextSpan(
                      text: "Sign Up here",
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
