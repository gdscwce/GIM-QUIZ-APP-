import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/constants.dart';
import 'package:gdscquiz/screens/loginScreen.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColour,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome To Treasure Hunt -2K22" ,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.white,
            )),
            SizedBox(
              height: 20,
            ),
            Text("presented by GDSC  <  >",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            )),

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
                        Navigator.pushReplacement((context), CupertinoPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: const Text(
                        "Next",
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
    );
  }
}
