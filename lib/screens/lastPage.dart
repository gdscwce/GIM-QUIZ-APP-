import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:gdscquiz/constants.dart';

class LastPage extends StatefulWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  final confettiController = ConfettiController();
  void initState() {
    super.initState();
    confettiController.play();
  }
  void dispose(){
    super.dispose();
    confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter,
        children: [
      Scaffold(
        backgroundColor: kColour,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("  Congratulations!!\n        You Did It" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),),
              Container(
                padding: EdgeInsets.all(60),
                child: Image.asset('assets/tresurefound.png'),
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
                        onPressed: () => exit(0),
                        child: const Text(
                          "Return to Home",
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
      ConfettiWidget(
          confettiController: confettiController,
        shouldLoop: true,
        blastDirection: pi/2,
        emissionFrequency: 0.2,
        numberOfParticles: 20,
      )
    ]);
  }
}
