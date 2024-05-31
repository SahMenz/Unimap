import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newmum/screens/authScreen/choosingInstitute.dart';
import 'package:newmum/screens/authScreen/utils.dart';
import 'package:newmum/widget/generalWidget/uniheader.dart';
import '../../constant/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String usernamePattern = r'^[a-zA-Z0-9_.-]{6,20}$';

  void _onContinue() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return choosingInstitute();
          },
        ),
      );
    }
  }

  String? validateUserName(String? username) {
    if (username?.isEmpty ?? true) {
      return 'Username cannot be empty.';
    } else if (!RegExp(usernamePattern).hasMatch(username!)) {
      return 'Username must be 6-20 characters long and can contain letters, numbers, underscores, periods, and hyphens.';
    }
    return null;
  }

  var UserNameSaved = "";
  var passwordSaved = "";

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long";
    } else if (!RegExp(r"[a-zA-Z]").hasMatch(value)) {
      return "Password must contain at least one letter";
    } else if (!RegExp(r"[0-9]").hasMatch(value)) {
      return "Password must contain at least one number";
    } else if (!RegExp(r"[!@#\$%&'*,\.]").hasMatch(value)) {
      return "Password must contain at least one special character";
    }
    return null; // No errors found, password is valid
  }

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
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
                height: 81,
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
                            color: Color.fromARGB(255, 217, 217, 217),
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 37,
              ),
              const SizedBox(
                width: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please add your profile ",
                      style: TextStyle(
                        fontFamily: "NexaDemo-Bold",
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Picture and Username. ",
                      style: TextStyle(
                        fontFamily: "NexaDemo-Bold",
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 39,
              ),
              SizedBox(
                width: 382,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 49,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 49,
                                backgroundImage:
                                    AssetImage("assets/images/avatar.png"),
                              ),
                        Positioned(
                          bottom: -5,
                          left: 65,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 77,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (value) {
                        UserNameSaved = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: validateUserName,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 239, 239, 239),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        hintText: "@Username",
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
                      onSaved: (value) {
                        passwordSaved = value!;
                      },
                      validator: _validatePassword,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 239, 239, 239),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5)),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          fontFamily: "Outfit-Medium",
                          color: Color.fromARGB(150, 72, 72, 72),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 68),
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
            ],
          ),
        ),
      ),
    );
  }
}
