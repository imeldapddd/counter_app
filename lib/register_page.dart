import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final _konfirmasiC = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    _konfirmasiC.dispose();
    super.dispose();
  }

  void _pesan(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));
  }

  Future<void> _daftar() async {
    final email = _emailC.text.trim();
    final pass = _passC.text;

    if (email.isEmpty || pass.isEmpty) {
      _pesan('Email dan password harus diisi');
      return;
    }
    if (pass != _konfirmasiC.text) {
      _pesan('Konfirmasi password tidak sama');
      return;
    }

    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      if (!mounted) return;
      _pesan('Pendaftaran berhasil, silakan masuk');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            Center(
              child: Image.asset('assets/images/signup.png', height: 240),
            ),
            const SizedBox(height: 40),
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
            CustomTextFormField(
              hint: 'Konfirmasi Password',
              controller: _konfirmasiC,
              isPassword: true,
            ),
            const SizedBox(height: 8),
            TombolUtama(
                teks: 'Mendaftar', loading: _loading, onPressed: _daftar),
            const SizedBox(height: 32),
            const PemisahAtau(teks: 'Atau daftar menggunakan'),
            const SizedBox(height: 32),
            const TombolGoogle(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sudah punya akun? silahkan',
                    style: TextStyle(fontSize: 12)),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  ),
                  child: const Text(' masuk',
                      style: TextStyle(color: biru, fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}