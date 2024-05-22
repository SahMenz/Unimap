import 'package:flutter/material.dart';
import 'package:newmum/screens/authScreen/authScreen.dart';
import 'package:newmum/screens/mainScreen/mumMainScreen.dart';
import 'package:newmum/widget/generalWidget/uniheader.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();
  String namePattern = r'^[a-zA-Z]+(?: [a-zA-Z]+)*\$';

  String? validateName(String? name) {
    if (name?.isEmpty ?? true) {
      return 'Incorrect credentials, please try again.';
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
            return mumMainScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                const SizedBox(
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Happy to",
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
                        "help!",
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
                        keyboardType: TextInputType.emailAddress,
                        validator: validateName,
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
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: validateName,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 239, 239, 239),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5)),
                          hintText: "password",
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
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: 382,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF484848),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 92,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
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
                              return const AuthScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
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
        ));
  }
}
