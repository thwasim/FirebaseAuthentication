import 'package:firebase_program/pages/login/controller/logincontroller.dart';
import 'package:firebase_program/pages/singup/widget/singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends GetView<Logincontroller>{
  MyHomePage({Key? key}) : super(key: key);

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  final Logincontroller controller = Get.put(Logincontroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'LOGIN\nACCOUNT',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Form(
                  key: controller.formKey,
                  child: GetBuilder<Logincontroller>(
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35, right: 35),
                            child: Column(
                              children: [
                                TextFormField(
                                  autofocus: false,
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please Enter Your Email");
                                    }
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please Enter a Valid Eamil");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    emailcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.mail),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  autofocus: false,
                                  controller: passwordcontroller,
                                  obscureText: true,
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Password is Required For Login");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid Password(Min. 6 Character");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    passwordcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.vpn_key),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(30),
                                  color:const Color(0xFFF1C950),
                                  child: MaterialButton(
                                    padding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    minWidth: MediaQuery.of(context).size.width,
                                    onPressed: () {
                                    controller.signIn(emailcontroller.text,
                                          passwordcontroller.text);
                                    },
                                    child: const Text('Login',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text("Don't Have an Account"),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => RegistrationScreen());
                                      },
                                      child: const Text(
                                        'SignUp',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
