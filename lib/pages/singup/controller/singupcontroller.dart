
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_program/model/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Singupcontroller extends GetxController {

  

  //  Future<void> openGallery(BuildContext context) async {
  //   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;

  //  // final imagetempray = File(image.path);

  //   // update();
  //   //   imagefile = imagetempray;
  //   // update();
  //   addImage(image);
  // }

  // String? img;

  // addImage(XFile pickImage) async {
  //   // ignore: unnecessary_null_comparison
  //   if (pickImage == null) {
  //     return;
  //   } else {
  //     final bytes = File(pickImage.path).readAsBytesSync();
  //     img = base64Encode(bytes);
  //     Usermodel? user;
  //     final docuser = FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser!.email.toString()).doc(user!.uid);
  //     docuser.update({
  //       "image" : "pic"
  //     });
  //   }
  // }

}
