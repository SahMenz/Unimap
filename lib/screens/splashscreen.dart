import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newmum/constant/app_assest.dart';
import 'package:newmum/screens/MyHomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => navigateToSecondScreen());
  }

  void navigateToSecondScreen() {
    // Replace "SecondScreen" with the actual class of your next screen
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 8, 8),
      body: Center(
        child: Image(
          image: AssetImage(AppAsset.initialScreenImg),
        ),
      ),
    );
  }
}
