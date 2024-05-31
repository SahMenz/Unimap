import 'package:flutter/material.dart';
import 'package:newmum/screens/authScreen/authScreenEmail.dart';
import 'package:newmum/screens/authScreen/loginScreen/loginScreen.dart';
import 'package:newmum/widget/authWidget/indicators.dart';
import 'package:newmum/widget/generalWidget/uniheader.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  Color _buttonColor = Colors.grey;

  String namePattern = r'^[a-zA-Z]+(?: [a-zA-Z]+)*\$';
  var _Savedfirstname = "";
  var _Savedlastname = "";

  String? validateName(String? name) {
    if (name?.isEmpty ?? true) {
      return 'Please enter your name.';
    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(name!)) {
      return 'Name should only contain letters.';
    }
    return null;
  }

  void _onContinue() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AuthEmailScreen();
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
                height: 99,
              ),
              const Indicators(),
              const SizedBox(
                height: 35,
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
                        fontSize: 45,
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
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 71,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        _Savedfirstname = value!;
                      },
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.name,
                      validator: validateName,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 239, 239, 239),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        hintText: "First Name",
                        hintStyle: const TextStyle(
                          fontFamily: "Outfit-Medium",
                          color: Color.fromARGB(150, 72, 72, 72),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        _Savedlastname = value!;
                      },
                      validator: validateName,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 239, 239, 239),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        hintText: "Last Name",
                        hintStyle: const TextStyle(
                          fontFamily: "Outfit-Medium",
                          color: Color.fromARGB(150, 72, 72, 72),
                          fontSize: 16,
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
                              fontSize: 23),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
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
                        fontSize: 16,
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
                            fontSize: 20,
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
                      fontSize: 16,
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
                        fontSize: 16,
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
