import 'dart:async';
import 'package:book_store_app/ui/auth/auth_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  void splashTimer() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/images/splash_image.png', fit: BoxFit.cover),
    );
  }
}
