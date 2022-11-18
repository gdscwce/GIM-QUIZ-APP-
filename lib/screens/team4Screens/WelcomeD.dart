import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/screens/team4Screens/team4Question.dart';

import '../../constants.dart';

class WelcomeD extends StatelessWidget {
String name;
WelcomeD({required this.name});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/WelcomeBackground.png'),
              fit: BoxFit.fill)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                    child: Text(
                      'Hello ${name}',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: Text('Welcome to Treasure Hunt 2K22',
                      style:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffE3FCF6),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => TeamDQuestions()));
                            },
                            child: const Text(
                              "Let's get Started!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: kTextColour,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
