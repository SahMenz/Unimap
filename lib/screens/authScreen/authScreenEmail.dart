import 'package:flutter/material.dart';
import 'package:newmum/constant/app_color.dart';
import 'package:newmum/screens/authScreen/loginScreen/loginScreen.dart';
import 'package:newmum/screens/authScreen/verification.dart';
import 'package:newmum/widget/generalWidget/uniheader.dart';

class AuthEmailScreen extends StatefulWidget {
  const AuthEmailScreen({super.key});

  @override
  State<AuthEmailScreen> createState() => _AuthEmailScreenState();
}

class _AuthEmailScreenState extends State<AuthEmailScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = new TextEditingController(text: "@gmail.com");
  TextEditingController _phone = new TextEditingController();

  String namePattern = r'^[a-zA-Z]+(?: [a-zA-Z]+)*\$';
  var _SavedEmail = "";
  var _SavedNumber = "";

  void _onContinue() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ChooseVerificationMethod
              (
              emailaddress: _email.text,
              phone: _phone.text,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 80,
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
                          decoration: BoxDecoration(
                            color: AppColor.grey,
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
                            border:
                                const Border.fromBorderSide(BorderSide.none),
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
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lets take",
                      style: TextStyle(
                        fontFamily: "NexaDemo-Bold",
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "you there!",
                      style: TextStyle(
                        fontFamily: "NexaDemo-Bold",
                        fontSize:32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        _SavedEmail = value!;
                      },
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your email.';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*")
                            .hasMatch(value!)) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 239, 239, 239),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        hintText: "Email Address",
                        hintStyle: const TextStyle(
                          fontFamily: "Outfit-Medium",
                          color: Color.fromARGB(150, 72, 72, 72),
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _SavedNumber = value!;
                      },
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter Your Phone Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 239, 239, 239),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        hintText: "Phone Number",
                        hintStyle: const TextStyle(
                          fontFamily: "Outfit-Medium",
                          color: Color.fromARGB(150, 72, 72, 72),
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 21),
                    SizedBox(
                      width: 380,
                      height: 60,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: (_formKey.currentState != null &&
                                  _formKey.currentState!.validate())
                              ? Colors.red
                              : Colors.grey,
                          side: BorderSide.none,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontFamily: "Outfit-Medium",
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: _onContinue,
                        child: const Text("Continue"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const Stack(
                children: [
                  Divider(
                    thickness: 1.0,
                    color: Color.fromARGB(255, 217, 217, 217),
                  ),
                  Center(
                    child: Text(
                      "  Continue with ",
                      style: TextStyle(
                        fontFamily: "Outfit-Medium",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 217, 217, 217),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 380,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 217, 217, 217),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/googlelogo.jpg'),
                      const SizedBox(width: 7),
                      const Text(
                        "Google",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Outfit-Medium",
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 173, 173, 173),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Outfit-Medium",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const loginScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 250, 8, 8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Outfit-Medium",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
