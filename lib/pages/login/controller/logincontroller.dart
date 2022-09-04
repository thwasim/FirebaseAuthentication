import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_program/pages/home/widget/screenhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class Logincontroller extends GetxController{
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

   void signIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Get.offAll(()=>const Screenhome())
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
