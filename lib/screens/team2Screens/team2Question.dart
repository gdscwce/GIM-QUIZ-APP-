import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../QuestionStructure.dart';
import '../../constants.dart';
import '../lastPage.dart';

class TeamBQuestions extends StatefulWidget {
  const TeamBQuestions({Key? key}) : super(key: key);

  @override
  State<TeamBQuestions> createState() => _TeamBQuestionsState();
}

class _TeamBQuestionsState extends State<TeamBQuestions> {
  bool isTapped = false;

  String ans = "";

  late String totalTime;
  List<QuestionStruct> questionbank = [
    QuestionStruct(
        R1: 'Paani ke neeche rehati hu naam galat hai mera Lakdi  ka chota Ghar hu jaise milti sabse har pal  jab hoi savera Dosti bade mere yaha. Dundo muze hunga kahi tumhare najdik hi.',
        R2: 'I am so simple that I can only point, yet I can guide people all over the world.',
        R3: 'What are the three  smallest positive numbers that give the same result when multiplied and added together?',
        A: 'COMPASS123',
        l: 'LEVEL 1'),
    QuestionStruct(
        l: 'LEVEL 2',
        R1: 'The center of the learning place Which makes you think it has branches of wisdom and leaves of peace?  Find me, I might be somewhere near you ',
        R2: 'Two in a corner, 1 in a room, 0 in a house, but 1 in a shelter. What am I?',
        R3: 'A sum of Rs.1890 has to be used to give 9 prizes to the customers of a super market for their overall academic purchases. If each prize is Rs.30 less than its preceding price, what is the least value of the price ?',
        A: '8290'),
    QuestionStruct(
        l: 'LEVEL 3',
        R1: 'I am a circle surrounded by technology and nature where students gather for hangout and refreshment and your project discussion is incomplete without me.Let\'s see if you can find me.',
        R2: 'What can travel all around the world without leaving its corner?',
        R3: 'The  length of a side of rhombus is 5 cm and one of its diagonals is of lengths 8 cm. The length of the other diagonal is ',
        A: '6STAMP'),
    QuestionStruct(
        l: 'LEVEL 4',
        R1: 'I am center of wce and a event is incomplete without having a pic with me. Find me with your whole team.',
        R2: '',
        R3: '',
        A: 'ALOHOMORA')
  ];

  int questionNo = 0;

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //    timer = Provider.of <AppTimer>(context,listen: false);
  // }

  final AnswerField = TextFormField(
    autofocus: false,
    controller: kAnswerText,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return ("Please enter you Answer");
      }

      return null;
    },
    onSaved: (value) {
      kAnswerText.text = value!;
    },
    textInputAction: TextInputAction.none,
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Enter Code ",
    ),
  );

  // timer
  String Sminute = "00", Ssecond = "00";
  int minutes = 0, second = 0;
  late Timer timer;

  List laps = [];

  void pauseTime() {
    timer.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondIncrement();
    });
  }

  void lapAdd() {
    String lap = "$Sminute : $Ssecond";
    setState(() {
      laps.add(lap);
    });
  }

  void secondIncrement() {
    setState(() {
      if (second < 59) {
        second++;
        Ssecond = second.toString();
        if (Ssecond.length == 1) {
          Ssecond = "0" + Ssecond;
        }
      } else {
        minIncrement();
      }
    });
  }

  void minIncrement() {
    setState(() {
      second = 0;
      Ssecond = "00";
      minutes++;
      Sminute = minutes.toString();
      if (Sminute.length == 1) {
        Sminute = "0" + Sminute;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff4285F4)),
                  width: MediaQuery.of(context).size.width / 4,
                  height: 40,
                  child: Center(
                    child: Text(
                      '$Sminute : ' + '$Ssecond ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .30,
              height: 40,
              child: Center(
                child: FittedBox(
                  child: Text(
                    questionbank[questionNo].level,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .85,
                      height: kContainerH,
                      decoration: const BoxDecoration(
                        color: KcontainerColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: kPadding,
                              child: Text(questionbank[questionNo].riddle1,
                                  style: kRiddleText),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .85,
                      height: kContainerH,
                      decoration: const BoxDecoration(
                        color: KcontainerColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: kPadding,
                              child: Text(questionbank[questionNo].riddle2,
                                  style: kRiddleText),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .85,
                      height: kContainerH,
                      decoration: const BoxDecoration(
                        color: KcontainerColor,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: kPadding,
                              child: Text(questionbank[questionNo].riddle3,
                                  style: kRiddleText),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnswerField,
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width / 4,
                      onPressed: () {
                        setState(() {
                          ans = kAnswerText.text;
                          if (ans.trim() == questionbank[questionNo].answer) {
                            if (questionNo < questionbank.length - 1) {
                              questionNo++;
                              lapAdd();
                            } else {
                              pauseTime();
                              lapAdd();
                              totalTime = "$Sminute : $Ssecond";
                              Navigator.of(context)
                                  .pushReplacement(CupertinoPageRoute(
                                      builder: (context) => LastPage(
                                            totalTime: totalTime,
                                            lap: laps,
                                          )));
                            }
                          } else if (ans == '') {
                            showDialog(
                                context: (context),
                                builder: (context) {
                                  return Container(
                                    child: AlertDialog(
                                      title: Text("Write Something"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Ok"))
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            showDialog(
                                context: (context),
                                builder: (context) {
                                  return Container(
                                    child: AlertDialog(
                                      title: Text("Opps!! You're Wrong"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Ok"))
                                      ],
                                    ),
                                  );
                                });
                          }
                        });
                        // setState(() {
                        //   pauseTime();
                        //
                        // });
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
            Container(
              child: Image.asset(
                'assets/bottom.png',
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
