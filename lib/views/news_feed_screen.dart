// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_managment_flutter/views/feeds_image_container.dart';
import 'package:task_managment_flutter/widgets/avater_text.dart';
import 'package:task_managment_flutter/widgets/reusable_text.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [Text("Home")],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "EMS",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              )),
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ));
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReusableText(
                text: "What’s going on today",
                fontSize: 20,
                fontWeight: FontWeight.w900),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  const AvaterText(
                      image: "images/elipses.png", text: "anneton"),
                  const FeedsImageContainer(image: "images/bg.png"),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12, top: 15),
                          alignment: Alignment.center,
                          width: 60,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  width: 1, color: const Color(0xFFADD8E6))),
                          child: const Text(
                            "10-11",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              const ReusableText(
                                  text: "YOGA WEEKEND",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        AssetImage("images/one.png"),
                                  ),
                                  SizedBox(width: 3),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        AssetImage("images/two.png"),
                                  ),
                                  SizedBox(width: 3),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        AssetImage("images/three.png"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      constraints:
                                          const BoxConstraints.tightForFinite(),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {},
                                      icon: const Icon(Icons.favorite,
                                          color: Colors.red)),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: ReusableText(
                                        text: "135",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                      constraints:
                                          const BoxConstraints.tightForFinite(),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {},
                                      icon: const FaIcon(
                                        FontAwesomeIcons.comment,
                                        size: 22,
                                      )),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: ReusableText(
                                        text: "140",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                      constraints:
                                          const BoxConstraints.tightForFinite(),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.near_me_outlined,
                                        size: 25,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.bookmark_outline,
                              size: 28,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
