import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:task_managment_flutter/constant/constants.dart';
import 'package:task_managment_flutter/views/home_page.dart';

class UserController extends GetxController {
  var isLoading = false.obs;

  saveProfileToDatabase(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String dob,
      required String sex,
      required File? image}) async {
    if (image == null) {
      Get.snackbar("Profile Error", "Please select a Profile Image");
    } else if (firstName.isEmpty ||
        lastName.isEmpty ||
        phoneNumber.isEmpty ||
        dob.isEmpty ||
        sex.isEmpty) {
      Get.snackbar("Empty Field", "Plase fill all fields");
    } else {
      Reference ref = storage.ref().child("profileImage");
      try {
        isLoading(true);
        await ref.putFile(image);
        String imageUrl = await ref.getDownloadURL();

        await firestore.collection("users").doc(auth.currentUser!.uid).set({
          "uid": auth.currentUser!.uid,
          "firstName": firstName,
          "lastName": lastName,
          "mobileNumber": phoneNumber,
          "dob": dob,
          "sex": sex,
          "imageUrl": imageUrl
        });
        isLoading(false);
        Get.to(() => const HomePageScreen());
      } on FirebaseException catch (e) {
        isLoading(false);
        Get.snackbar("Upload Error", e.message.toString());
      }
    }
  }
}
