import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  void _pesan(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));
  }

  Future<void> _masuk() async {
    final email = _emailC.text.trim();
    final pass = _passC.text;

    if (email.isEmpty || pass.isEmpty) {
      _pesan('Email dan password harus diisi');
      return;
    }

    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      _pesan(e.message ?? 'Terjadi kesalahan');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset('assets/images/login.png', height: 200),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    hint: 'Email',
                    controller: _emailC,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextFormField(
                    hint: 'Password',
                    controller: _passC,
                    isPassword: true,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Lupa password?',
                        style: TextStyle(fontSize: 12)),
                  ),
                  const SizedBox(height: 16),
                  TombolUtama(
                      teks: 'Masuk', loading: _loading, onPressed: _masuk),
                  const SizedBox(height: 24),
                  const PemisahAtau(teks: 'Atau masuk menggunakan'),
                  const SizedBox(height: 24),
                  const TombolGoogle(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum punya akun? ',
                      style: TextStyle(fontSize: 12)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    ),
                    child: const Text('Mendaftar',
                        style: TextStyle(color: biru, fontSize: 12)),
                  ),
                  const Text(' sekarang', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}