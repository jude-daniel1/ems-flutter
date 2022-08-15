// ignore_for_file: library_private_types_in_public_api
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_managment_flutter/controller/user_controller.dart';
import 'package:task_managment_flutter/widgets/reusable_elevated_button.dart';
import 'package:task_managment_flutter/widgets/reusable_text.dart';
import 'package:task_managment_flutter/widgets/terms_condition.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  String? firstName, lastName, mobileNumber;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String gender = "male";
  File? profileImage;
  late UserController userController;

  @override
  void initState() {
    super.initState();
    userController = Get.put(UserController());
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.day,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2101));
    if (picked != null) {
      dateOfBirthController.text =
          '${picked.day}-${picked.month}-${picked.year}';
    }
  }

  imagePickerDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("choos Image Source"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      profileImage = File(image.path);
                      setState(() {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      profileImage = File(image.path);
                      setState(() {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: const Icon(
                    Icons.browse_gallery,
                    size: 25,
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    dateOfBirthController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                .copyWith(bottom: 1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.85,
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const ReusableText(
                                text: "Profile",
                                fontSize: 28,
                                fontWeight: FontWeight.w900),
                            SizedBox(height: size.height * 0.02),
                            const ReusableText(
                                text:
                                    "Welcome, Plz Complete your Profile to see events from your friends",
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            SizedBox(height: size.height * 0.02),
                            InkWell(
                                onTap: () async {
                                  imagePickerDialog();
                                },
                                child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        shape: BoxShape.circle),
                                    child: profileImage == null
                                        ? CircleAvatar(
                                            radius: 56,
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.1),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.blue,
                                              size: 50,
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 56,
                                            backgroundColor: Colors.white,
                                            backgroundImage:
                                                FileImage(profileImage!),
                                          ))),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  firstName = value.trim();
                                });
                              },
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "First Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              controller: firstNameController,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 8, left: 10),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                ),
                                labelText: "First name",
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5), width: 0.9),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  lastName = value.trim();
                                });
                              },
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Last Name cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              controller: lastNameController,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 8, left: 10),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                ),
                                labelText: "Last Name",
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5), width: 0.9),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  mobileNumber = value.trim();
                                });
                              },
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Mobile Number cannot be empty";
                                } else if (value.trim().length != 11) {
                                  return "Please provide a valide phone number";
                                } else {
                                  return null;
                                }
                              },
                              controller: mobileNumberController,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 8, left: 10),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                ),
                                labelText: "Mobile Number",
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5), width: 0.9),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            TextFormField(
                              readOnly: true,
                              onTap: () {
                                _selectDate(context);
                              },
                              controller: dateOfBirthController,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.datetime,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 8, left: 10),
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                ),
                                labelText: "Date of Birth",
                                suffixIcon:
                                    Icon(Icons.perm_contact_calendar_outlined),
                                labelStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5), width: 0.9),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.015),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                    activeColor: const Color(0xFF274560),
                                    value: "male",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    }),
                                const Text(
                                  "Male",
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 15.0),
                                Radio(
                                    activeColor: const Color(0xFF274560),
                                    value: "female",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    }),
                                const Text(
                                  "Female",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.03),
                            Obx(() {
                              return Container(
                                child: userController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : ReusableElevatedButton(
                                        text: "Sign up",
                                        function: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            userController
                                                .saveProfileToDatabase(
                                                    firstName: firstName!,
                                                    lastName: lastName!,
                                                    phoneNumber: mobileNumber!,
                                                    dob: dateOfBirthController
                                                        .text,
                                                    sex: gender,
                                                    image: profileImage!);
                                          }
                                        }),
                              );
                            })
                          ]),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: size.height * 0.15,
                    child: const ReusableTermsAndCondition(padding: 1),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
