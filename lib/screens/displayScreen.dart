import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/screens/loginScreen.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome To Treasure Hunt -2K22"),
          SizedBox(
            height: 20,
          ),
          Text("presented by GDSC  <  >"),
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginScreen()));
            },
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}
