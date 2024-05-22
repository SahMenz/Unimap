import 'package:flutter/material.dart';

class mumMainScreen extends StatefulWidget {
  const mumMainScreen({super.key});

  @override
  State<mumMainScreen> createState() => _mumMainScreenState();
}

class _mumMainScreenState extends State<mumMainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(child: Text("MUM MAIN SCREEN"),),
    );
  }
}
