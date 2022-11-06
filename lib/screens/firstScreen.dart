import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/screens/loginScreen.dart';
import 'package:gdscquiz/screens/questionScreen1.dart';

import '../constants.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static const buttonColour = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColour,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/tresure.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Welcome to GDSC's \n      Treasure  Hunt",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color(0xffffffff)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "You can start Findind the Treasure  \n      by clicking on Start button",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white60),
              ),
              const SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Card(
                  color: kColour,
                  child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Start -->",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: kColour,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
