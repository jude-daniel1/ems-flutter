import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_managment_flutter/constant/constants.dart';
import 'package:task_managment_flutter/views/profile_screen.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  void login({required String email, required String password}) {
    isLoading(true);
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      isLoading(false);
      Get.to(() => const ProfileScreen());
    }).catchError((error) {
      isLoading(false);
      Get.snackbar("Error", error.toString());
    });
  }

  void signUp({required String email, required String password}) {
    isLoading(true);
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      isLoading(false);
      Get.to(() => const ProfileScreen());
    }).catchError((error) {
      isLoading(false);
      Get.snackbar("Error", error.toString());
    });
  }

  signInWithGoogle() async {
    isLoading(true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isLoading(false);
      Get.to(() => const ProfileScreen());
    }).catchError((error) {
      isLoading(false);
      Get.snackbar("Error", error.toString());
    });
  }

  forgetPassword({required String email}) {
    isLoading(true);
    auth.sendPasswordResetEmail(email: email).then((value) {
      Get.snackbar(
          "Reset Password", "Password reset link has been sent to your email");

      isLoading(false);
    }).catchError((error) {
      isLoading(false);
      Get.snackbar("Error", "Error sending password reset link");
    });
  }
}
