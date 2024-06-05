import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterAuthCode extends StatefulWidget {
  const EnterAuthCode({
    super.key,
    required this.ProfileScreen,
    required this.chosenCredential,
  });

  final Widget ProfileScreen;
  final String chosenCredential;

  @override
  State<EnterAuthCode> createState() => _EnterAuthCodeState();
}

class _EnterAuthCodeState extends State<EnterAuthCode> {
  int _secondsRemaining = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _secondsRemaining > 0
        ? Scaffold(
            body: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/otpbackground.png"),
                      fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Container(
                    height: 332,
                    width: 325,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Enter",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NexaDemo-Bold",
                                  ),
                                ),
                                const Text(
                                  "Authentication",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NexaDemo-Bold",
                                  ),
                                ),
                                const Text(
                                  "Code",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NexaDemo-Bold",
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "sent to ",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "outfitMedium",
                                      ),
                                    ),
                                    Text(
                                      widget.chosenCredential,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "outfitMedium",
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 39,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 13),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(8.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(50, 81, 81, 70),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1, // Set width for the line
                                  height: 13, // Adjust height as needed
                                  color: Colors.grey.shade300, // Set color
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 39,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 13),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(8.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(50, 81, 81, 70),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1, // Set width for the line
                                  height: 13, // Adjust height as needed
                                  color: Colors.grey.shade300, // Set color
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 39,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 13),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(8.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(50, 81, 81, 70),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1, // Set width for the line
                                  height: 13, // Adjust height as needed
                                  color: Colors.grey.shade300, // Set color
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 39,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 13),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(8.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(50, 81, 81, 70),
                                    ),
                                  ),
                                ),Container(
                                  width: 1, // Set width for the line
                                  height: 13, // Adjust height as needed
                                  color: Colors.grey.shade300, // Set color
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 39,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 13),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(8.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(10.6),
                                      ),
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(50, 81, 81, 70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          Text(
                            "Resend code in: $_secondsRemaining secs",
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              fontFamily: "outfitMedium",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : widget.ProfileScreen;
  }
}
