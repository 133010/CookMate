
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  // CONTROLLER INPUT
  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // STATUS PASSWORD
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // STATUS LOADING
  bool _isLoading = false;

  // FUNGSI REGISTER FIREBASE
  Future<void> _register() async {

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // MEMERIKSA INPUT KOSONG
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua kolom harus diisi'),
        ),
      );
      return;
    }

    // MEMERIKSA PANJANG PASSWORD
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password minimal 6 karakter'),
        ),
      );
      return;
    }

    // MEMERIKSA KECOCOKAN PASSWORD
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Konfirmasi password tidak cocok'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {

      // MEMBUAT AKUN DI FIREBASE
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // MENYIMPAN NAMA PENGGUNA
      await credential.user?.updateDisplayName(name);

      if (!mounted) return;

      // REGISTER BERHASIL, MASUK KE HOME
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );

    } on FirebaseAuthException catch (e) {

      String message;

      switch (e.code) {

        case 'email-already-in-use':
          message = 'Email sudah terdaftar. Silakan login.';
          break;

        case 'invalid-email':
          message = 'Format email tidak valid.';
          break;

        case 'weak-password':
          message = 'Password terlalu lemah.';
          break;

        case 'operation-not-allowed':
          message = 'Email/Password belum diaktifkan di Firebase.';
          break;

        case 'network-request-failed':
          message = 'Periksa koneksi internet kamu.';
          break;

        default:
          message = 'Registrasi gagal. Silakan coba lagi.';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );

    } catch (e) {

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terjadi kesalahan. Silakan coba lagi.'),
          backgroundColor: Colors.red,
        ),
      );

    } finally {

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // LOGO DAN NAMA COOKMATE
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,

                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE9E9),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Image.asset(
                      'assets/CookMate symbol.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Text(
                    'CookMate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF302923),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // GAMBAR MAKANAN
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/CookMate.png',
                  width: 116,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 15),

              // JUDUL
              const Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Buat akun dan ayo mulai pengalaman memasakmu!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 26),

              // NAMA LENGKAP
              const Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF302923),
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,

                decoration: InputDecoration(
                  hintText: 'Masukkan nama lengkap',

                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),

                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  fillColor: Colors.white,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFFFF343B),
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 26),

              // EMAIL
              const Text(
                'Alamat Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 7),

              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  hintText: 'Masukkan alamat emailmu',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // PASSWORD
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 7),

              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,

                decoration: InputDecoration(
                  hintText: 'Masukkan password',

                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isPasswordVisible =
                            !_isPasswordVisible;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // KONFIRMASI PASSWORD
              const Text(
                'Konfirmasi Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 7),

              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,

                decoration: InputDecoration(
                  hintText: 'Ulangi password',

                  prefixIcon: const Icon(
                    Icons.lock_outline,
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible =
                            !_isConfirmPasswordVisible;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // TOMBOL BUAT AKUN
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFEE2F35),
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: _isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Buat Akun',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 50),

              // NAVIGASI KE LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(width: 4),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const LoginScreen(),
                        ),
                      );
                    },

                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                    ),

                    child: const Text(
                      'Login Sekarang',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}