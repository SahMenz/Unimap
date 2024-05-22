import 'package:flutter/material.dart';

class Uniheader extends StatelessWidget {
  const Uniheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Text(
        'UNIMAP',
        style: TextStyle(
          fontSize: 37,
          fontWeight: FontWeight.w600,
          fontFamily: "ifkica-bold",
          color: Color.fromARGB(255, 250, 8, 8),
        ),
      ),
    );
  }
}