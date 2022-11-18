import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:gdscquiz/constants.dart';



class LastPage extends StatefulWidget {
  String totalTime;
  List lap;
LastPage({required this.totalTime,required this.lap});
  @override
  State<LastPage> createState() => _LastPageState(totalTime:totalTime.toString(), lap: lap,);

}

class _LastPageState extends State<LastPage> {
  String totalTime;
  List lap;
  _LastPageState({required this.totalTime,required this.lap});
  final confettiController = ConfettiController();


  void initState() {
    super.initState();
    confettiController.play();
  }

  void dispose() {
    super.dispose();
    confettiController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Stack(alignment: Alignment.topCenter, children: [
      Scaffold(
        backgroundColor: kColour,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                child: Image.asset('assets/Component1.png'),
              ),
              FittedBox(
                  child: Text(
                "  Congratulations!! ",
                style:KTextstyle,
              )),
              SizedBox(
                height: 10,
              ),
              FittedBox(
                  child: Text(
                    " You Did It ",
                    style:KTextstyle,
                  )),
              SizedBox(
                height: 10,
              ),
               FittedBox(
                 child: Text('Your Total Time Was : ${totalTime}',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 17,
                 ),),
               ),
              SizedBox(
                height: 10,
              ),


              FittedBox(
                child: Container(
                  padding: EdgeInsets.all(60),
                  child: Image.asset('assets/last page image.png'),
                ),
              ),
              FittedBox(
                child: Text('You Compleated  \nLEVEL 1 on ${lap[0]}\nLEVEL 2 on ${ lap[1] }\nLEVEL 3 on ${lap[2]}\nLEVEL 4 on ${lap[3]}',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ) ,),
              )

            ],
          ),
        ),
      ),  
      ConfettiWidget(
        confettiController: confettiController,
        shouldLoop: false,
        blastDirection: pi / 2,
        emissionFrequency: 0.2,
        numberOfParticles: 5,
      )
    ]);
  }
}

