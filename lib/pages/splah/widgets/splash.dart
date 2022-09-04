
import 'package:firebase_program/pages/login/widget/loginpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF2C2C2C),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 300,
                      child: Image.asset("assets/vegetablesFruit.png"),
                  ),
                  const SizedBox(
                    height: 350,
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Text("KEEPING YOU HEALTHY",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFF1C950),
                      letterSpacing: 7.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Let's start Eating\nHealthy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    letterSpacing: 2.0,
                  ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 320,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFF1C950),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Get Started",
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                        ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon( // <-- Icon
                          Icons.arrow_right_alt,
                          size: 24.0,
                          color: Color(0xFF2C2C2C),
                        ),
                      ],
                    ),
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
