import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {
  const Indicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 78,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide.none),
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 217, 217, 217),
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide.none),
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 217, 217, 217),
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide.none),
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 217, 217, 217),
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide.none),
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 217, 217, 217),
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide.none),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
