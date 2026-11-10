import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      Navigator.pushReplacement(
  
        context,
        MaterialPageRoute(builder: (context) => Placeholder()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/CookMate symbol.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 16),
            const Text(
              'CookMate',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Discover Cook, Share',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
