import 'dart:core';
import 'package:flutter/material.dart';
import 'package:newmum/constant/app_font.dart';
import 'package:newmum/screens/authScreen/enterAuthCode.dart';
import 'package:newmum/screens/authScreen/profileScreen.dart';
import 'package:newmum/widget/generalWidget/uniheader.dart';

class ChooseVerificationMethod extends StatelessWidget {
  ChooseVerificationMethod(
      {super.key, required this.emailaddress, required this.phone});

  String emailaddress;
  String phone;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Uniheader(),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 99,
                ),
                Row(
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const SizedBox(
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          "Please select one",
                          style: TextStyle(
                            fontFamily: "NexaDemo-Bold",
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "credential to verify",
                          style: TextStyle(
                            fontFamily: "NexaDemo-Bold",
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 358,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnterAuthCode(
                          ProfileScreen: ProfileScreen(),
                          chosenCredential: emailaddress,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mail_outline_outlined,
                          color: Colors.black,
                          size: 40,
                          weight: 3,
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        Container(
                          width: 1, // Set width for the line
                          height: 73, // Adjust height as needed
                          color: Colors.grey.shade300, // Set color
                        ),
                        const SizedBox(
                          width: 27,
                        ),
                        Text(
                          emailaddress,
                          style: const TextStyle(
                            fontFamily: "Outfit-Medium",
                            fontSize: 16,
                            color: Color.fromARGB(255, 72, 72, 72),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnterAuthCode(
                          ProfileScreen: ProfileScreen(),
                          chosenCredential: phone,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.call,
                          color: Colors.black,
                          size: 40,
                          weight: 3,
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        Container(
                          width: 1, // Set width for the line
                          height: 73, // Adjust height as needed
                          color: Colors.grey.shade300, // Set color
                        ),
                        const SizedBox(
                          width: 27,
                        ),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontFamily: AppFont.outfitMedium,
                            fontSize: 16,
                            color: Color.fromARGB(255, 72, 72, 72),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
