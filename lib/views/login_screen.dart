// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_flutter/controller/auth_controller.dart';
import 'package:task_managment_flutter/views/forget_password_screen.dart';
import 'package:task_managment_flutter/views/register_screen.dart';
import 'package:task_managment_flutter/widgets/reusable_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email, password;

  late AuthController authController;
  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40)
              .copyWith(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ReusableText(
                  text: "EMS Sign In",
                  fontSize: 28,
                  fontWeight: FontWeight.w900),
              SizedBox(
                height: size.height * 0.03,
              ),
              const ReusableText(
                  text:
                      "Welcome back, Plz Sign in and continue your journey with us",
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              SizedBox(height: size.height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2.0, color: Colors.black))),
                    child: const Text(
                      "SignIn",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegisterScren())),
                    child: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 22),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
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
                              style: TextStyle(fontSize: 20),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.email_outlined),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFE5E5E5), width: 0.9))),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
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
                            constraints: BoxConstraints(
                              minHeight: 50,
                            ),
                            label: Text(
                              "Password",
                              style: TextStyle(fontSize: 20),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.lock_outline),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0x00E5E5E5), width: 0.9))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.to(() => const ForgetPasswordScreen());
                              },
                              child: const Text(
                                "Forgot password?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ))
                        ],
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
                                    authController.login(
                                        email: email!, password: password!);
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ));
                      }),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      const Text("Or Social Login"),
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
                          InkWell(
                            onTap: () async {
                              await authController.signInWithGoogle();
                            },
                            child: authController.isLoading.value
                                ? const CircularProgressIndicator()
                                : Container(
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
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
