import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_program/pages/home/widget/screenhome.dart';
import 'package:firebase_program/pages/login/widget/loginpage.dart';
import 'package:firebase_program/pages/splah/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.light,
        // primarySwatch: ,

      ),
      home:const HomePage(),
    );
  }
}

class Mainpage extends StatelessWidget {
  const Mainpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => 
  StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context,snapshot){
      if(snapshot.hasData){
         return const Screenhome();
      }else{
        return MyHomePage();
      }
    }
    );
}
