import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_program/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UserProfiles extends GetView {
  final String? name;
  final String? seconname;
  UserProfiles({this.name, this.seconname, key, required this.user})
      : super(key: key);

  Usermodel user;

  final profilefirstnameEditingController = TextEditingController();
  final profilesecondnameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    profilefirstnameEditingController.text = name!;
    profilesecondnameEditingController.text = seconname!;
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              user.image == null
                  ? const CircleAvatar(
                      maxRadius: 80,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            child: Image.network(
                              user.image.toString(),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Fisrt Name',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextFormField(
                controller: profilefirstnameEditingController,
                autofocus: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF1C950),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Second Name',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              TextFormField(
                controller: profilesecondnameEditingController,
                autofocus: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF1C950),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  update(user);
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFF1C950),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Update",
                      style: TextStyle(
                        color: Color(0xFF2C2C2C),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      size: 24.0,
                      color: Color(0xFF2C2C2C),
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

  void update(Usermodel userid) async {
    final usedoc = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.email.toString())
        .doc(userid.uid);
    await usedoc.update({
      'first name': profilefirstnameEditingController.text.trim(),
      'second name': profilesecondnameEditingController.text.trim()
    });
  }
}
