import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_flutter/controller/auth_controller.dart';
import 'package:task_managment_flutter/views/login_screen.dart';
import 'package:task_managment_flutter/widgets/reusable_elevated_button.dart';
import 'package:task_managment_flutter/widgets/reusable_text.dart';
import 'package:task_managment_flutter/widgets/reusable_textformfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  String? email;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 0.8, color: Colors.grey)),
                  child: InkWell(
                    onTap: () {
                      Get.off(() => const LoginScreen());
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 18,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.045),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const ReusableText(
                        text: "Forget Password",
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                    SizedBox(height: size.height * 0.03),
                    const ReusableText(
                        text:
                            "Please enter your registerd email id we will send you an link to reset your password",
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                    SizedBox(height: size.height * 0.07),
                    TextFormField(
                      onChanged: (value) {
                        email = value.trim();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 8, left: 10),
                          constraints: BoxConstraints(
                            minHeight: 50,
                          ),
                          labelText: "Email Address",
                          labelStyle: TextStyle(fontSize: 18),
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFE5E5E5), width: 0.9))),
                    ),
                    SizedBox(height: size.height * 0.09),
                    authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : ReusableElevatedButton(
                            text: "Send Link",
                            function: () {
                              if (_formKey.currentState!.validate()) {
                                authController.forgetPassword(email: email!);
                              }
                            })
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
