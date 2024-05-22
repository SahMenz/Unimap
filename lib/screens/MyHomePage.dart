import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newmum/screens/authScreen/authScreen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => navigateToSecondScreen());
  }

  void navigateToSecondScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text(
            'UNIMAP',
            style: TextStyle(
              fontSize: 37,
              fontWeight: FontWeight.w600,
              fontFamily: "ifkica-bold",
              color: Color.fromARGB(255, 250, 8, 8),
            ),
          ),
        )
    );
  }
}

