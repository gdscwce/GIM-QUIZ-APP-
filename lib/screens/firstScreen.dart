import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/screens/displayScreen.dart';
import 'package:gdscquiz/screens/loginScreen.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    child: Container(
                      width: 70,

                      child: FittedBox(
                        child: Image(
                          image: AssetImage('assets/Component1.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                child: Image.asset('assets/GDSC.png'),
              ),
              const SizedBox(
                height: 40,
              ),
              FittedBox(
                child:  Text(
                  "presents",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset('assets/Group 9.png'),
              ),

              const SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  color: Colors.white,
                  child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width/4,
                        onPressed: () {
                          Navigator.pushReplacement(
                              (context),
                              CupertinoPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,

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
