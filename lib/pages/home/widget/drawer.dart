import 'package:firebase_program/model/usermodel.dart';
import 'package:firebase_program/pages/home/controller/homepagecontroller.dart';
import 'package:firebase_program/pages/home/widget/userprfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class Sizedrwaer extends StatelessWidget {
  Sizedrwaer({Key? key}) : super(key: key);

  Usermodel loggedInUser = Usermodel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E),
      child: GetBuilder<Homepagecontroller>(
          init: Homepagecontroller(),
          builder: (controller) {
            return ListView(padding: EdgeInsets.zero, children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              loggedInUser.image == null
                  ? const CircleAvatar(
                      maxRadius: 60,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            child: Image.network(
                              loggedInUser.image.toString(),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
              TextButton.icon(
                  onPressed: () {
                    controller.openGallery(context);
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  label: const Text(
                    'Add Profile',
                    style: TextStyle(color: Colors.blue),
                  )),
              const SizedBox(
                height: 30,
              ),
              Center(
                child:
                    Text("${loggedInUser.firstname}${loggedInUser.secondname}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text("${loggedInUser.email}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.back();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                title: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(UserProfiles(
                    user: loggedInUser,
                    name: loggedInUser.firstname,
                    seconname: loggedInUser.secondname,
                  ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.white,
                ),
                title: const Text(
                  "Logout Account",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.defaultDialog(
                      title: "Logout This Account",
                      middleText: "",
                      backgroundColor: Colors.black45,
                      titleStyle: const TextStyle(color: Colors.white),
                      textConfirm: "Confirm",
                      textCancel: "Cancel",
                      cancelTextColor: Colors.white,
                      confirmTextColor: Colors.white,
                      buttonColor: Colors.blue,
                      barrierDismissible: false,
                      radius: 20,
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () {
                        controller.logout(context);
                      });
                },
              ),
            ]);
          }),
    );
  }
}
