// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_flutter/controller/auth_controller.dart';
import 'package:task_managment_flutter/views/login_screen.dart';

class RegisterScren extends StatefulWidget {
  const RegisterScren({Key? key}) : super(key: key);

  @override
  _RegisterScrenState createState() => _RegisterScrenState();
}

class _RegisterScrenState extends State<RegisterScren> {
  late AuthController authController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? email, password, confirmPassword;
  @override
  void initState() {
    authController = Get.put(AuthController());
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
              .copyWith(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.88,
                child: Column(
                  children: [
                    const Text(
                      "EMS Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    const Text(
                      "Welcome back, Sign up to see events and classes from your friends",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              "SignIn",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 4),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: Colors.black))),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Sorry email field cannot be null";
                              }
                              return null;
                            },
                            controller: emailController,
                            onChanged: (value) {
                              email = value.trim();
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 8),
                              constraints: BoxConstraints(
                                minHeight: 50,
                              ),
                              label: Text(
                                "Email or Phone",
                                style: TextStyle(fontSize: 18),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0x00E5E5E5), width: 0.9),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.email_outlined),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can't be empty";
                              } else if (value.length < 6) {
                                return "password must be greater than 6";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            onChanged: (value) {
                              password = value.trim();
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 8),
                              constraints: BoxConstraints(minHeight: 50),
                              label: Text(
                                "Password",
                                style: TextStyle(fontSize: 18),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.lock_outline),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 0.9)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0x00E5E5E5), width: 0.9),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            onChanged: (value) {
                              confirmPassword = value.trim();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can't be empty";
                              } else if (value.trim() != password) {
                                return "Both password don't match";
                              } else {
                                return null;
                              }
                            },
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 8),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                ),
                                label: Text(
                                  "Re-enter Password",
                                  style: TextStyle(fontSize: 18),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.lock_outline),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0x00E5E5E5), width: 0.9))),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Obx(() {
                            return authController.isLoading.value
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFF274560),
                                        minimumSize: Size(size.width, 50)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        authController.signUp(
                                            email: email!, password: password!);
                                      }
                                    },
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ));
                          }),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          const Text(
                            "Or Connect With",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/facebook.png",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                width: 42,
                                height: 42,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/google.png",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "By signing up, you agree to our ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Terms, Data Policy and Cockie Policy",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                log("privacy clicked");
                              },
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          )
                        ])),
              )
            ],
          ),
        ),
      )),
    );
  }
}
