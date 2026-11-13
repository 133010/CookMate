import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

    class _LoginScreenState extends State<LoginScreen> {
      // Controller untuk mengambil input pengguna
    // Controller untuk mengambil input pengguna
    final TextEditingController _emailController =
        TextEditingController();

    final TextEditingController _passwordController =
        TextEditingController();

    // Mengatur icon mata
    bool _isPasswordVisible = false;

    // Mengatur loading
    bool _isLoading = false;

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


              const Text(
                'Selama Datang Kembali!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Semua Makanan Enak Berawal Dari Sini',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),


              const SizedBox(
                height: 26),
              const Text(
                'Alamat Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'plus jakarta sans',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 7),

               TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),

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
                    color: Color(0xFFEE2F35),
                    width: 2,
                  ),
                ),
              ),
            ),

                            // const Text(
             
              const SizedBox(height: 18),

              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'plus jakarta sans',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 7),

              
            TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,

                decoration: InputDecoration(
                  labelText: 'Password',

                  prefixIcon: const Icon(Icons.lock_outline),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
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

              SizedBox(
                width: double.infinity,
                height: 50,),

              SizedBox(
                  width: double.infinity,
                  height: 50,

            child: ElevatedButton(
              onPressed: _isLoading ? null : _login,

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF343B),
                foregroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
              const SizedBox(height: 100),
     

          // TULISAN DAFTAR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Belum punya akun?',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(width: 4),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const RegisterScreen(),
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
                  'Daftar',
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

Future<void> _login() async {
  final email = _emailController.text.trim();
  final password = _passwordController.text;

  // Memeriksa apakah input kosong
  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email dan password harus diisi'),
      ),
    );
    return;
  }

  setState(() {
    _isLoading = true;
  });

  try {
    // Memeriksa akun melalui Firebase
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (!mounted) return;

    // Login berhasil, masuk ke halaman utama
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );

  } on FirebaseAuthException catch (e) {
    String message;

    switch (e.code) {
      case 'invalid-email':
        message = 'Format email tidak valid';
        break;

      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        message = 'Email atau password salah';
        break;

      case 'user-disabled':
        message = 'Akun ini telah dinonaktifkan';
        break;

      case 'too-many-requests':
        message = 'Terlalu banyak percobaan. Coba lagi nanti';
        break;

      case 'network-request-failed':
        message = 'Periksa koneksi internet kamu';
        break;

      case 'operation-not-allowed':
        message = 'Metode login belum diaktifkan di Firebase';
        break;

      default:
        message = 'Login gagal. Silakan coba lagi';
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
        content: Text('Terjadi kesalahan. Silakan coba lagi'),
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
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

}
