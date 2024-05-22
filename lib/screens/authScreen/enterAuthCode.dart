import 'dart:ui';
import 'package:flutter/material.dart';

class EnterAuthCode extends StatefulWidget {
  const EnterAuthCode({super.key});

  @override
  State<EnterAuthCode> createState() => _EnterAuthCodeState();
}

class _EnterAuthCodeState extends State<EnterAuthCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
            // Adjust background color and opacity
            child: const Center(
              child: Center(
                child: Text("data"),
              ),
            ),
          )),
    );
  }
}
