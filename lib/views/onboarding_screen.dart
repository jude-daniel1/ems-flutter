import 'package:flutter/material.dart';
import 'package:task_managment_flutter/views/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 40)
              .copyWith(bottom: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.contain)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to EMS!",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 29),
                ),
                const Text(
                  "Event Management System",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Image.asset("images/task.png"),
                SizedBox(
                  height: size.height * 0.13,
                ),
                const Center(
                  child: Text(
                    "The social media platform designed to get you offline",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Center(
                  child: Text(
                    "EMS is an app where users can leverage their social network to create, discover, share and monetize events or services.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.02,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen())),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1)
                              ]),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 1.05),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
