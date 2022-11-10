import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_program/model/usermodel.dart';
import 'package:firebase_program/pages/home/widget/drawer.dart';
import 'package:firebase_program/pages/home/widget/viewall.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screenhome extends StatefulWidget {
  const Screenhome({Key? key}) : super(key: key);

  @override
  _ScreenhomeState createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<Screenhome> {
  User? user = FirebaseAuth.instance.currentUser;
  Usermodel loggedInUser = Usermodel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(user!.email.toString())
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = Usermodel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Fruit At Tree",
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1E1E1E)),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF1E1E1E),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 300,
                      ),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.transparent,
                          child: Image.network(loggedInUser.image.toString()),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return false;
            },
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext ctx, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 60.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 230,
                            child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: Image.asset("assets/showimage.jpg",
                                    fit: BoxFit.fill)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Fruits",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const AllFruits());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "View All",
                          style: TextStyle(
                              color: Color(0xFFF1C950),
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFF1C950),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 175,
                        height: 300,
                        child: Card(
                          color: const Color(0xFF2C2C2C),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(75.0),
                                  topRight: Radius.circular(75.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Image.asset("assets/apples.png"),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Fruit",
                                      style: TextStyle(
                                        color: Color(0xFFF1C950),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Apple",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15.0),
                                  child: Row(
                                    children: const [
                                      Text(
                                        "₹ 150.0",
                                        style: TextStyle(
                                            color: Color(0xFFF1C950),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "per Kg",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 175,
                        height: 300,
                        child: Card(
                          color: const Color(0xFF2C2C2C),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(75.0),
                                  topRight: Radius.circular(75.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: Image.asset("assets/Banana.png"),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Fruit",
                                      style: TextStyle(
                                        color: Color(0xFFF1C950),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.0, left: 15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Banana",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 15.0),
                                  child: Row(
                                    children: const [
                                      Text(
                                        "₹ 50.0",
                                        style: TextStyle(
                                            color: Color(0xFFF1C950),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "per Kg",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      drawer: Sizedrwaer(),
    );
  }
}
