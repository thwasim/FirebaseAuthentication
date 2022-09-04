import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_program/pages/splah/widgets/splash.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Homepagecontroller extends GetxController {
  File? imagefile;
  File? file;

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const HomePage());
  }

  displayDeleteDilog() {
    Get.defaultDialog(
        title: "Delete This Acount",
        titleStyle: const TextStyle(fontSize: 20),
        middleText: "Are you sure  to delete account",
        textCancel: "Cancel",
        textConfirm: "Confirm",
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.back();
        },
        onConfirm: () {});
  }

  Future<void> openGallery(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    await uploadImage(image);
  }

  String? url;

  uploadImage(XFile? img) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(img!.name);
      final uploadTask = ref.putFile(File(img.path));
      final snapshot = await uploadTask;
      url = await snapshot.ref.getDownloadURL();
      log('..............img=  $url');
      final docuser = FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.email.toString()).doc(FirebaseAuth.instance.currentUser!.uid.toString());
      docuser.update({
      'image':url
      });

    } catch (e) {
      log('...............exception = $e');
    }
  }
}
