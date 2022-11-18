import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../QuestionStructure.dart';
import '../../constants.dart';

import '../lastPage.dart';

class TeamAQuestions extends StatefulWidget {
  const TeamAQuestions({Key? key}) : super(key: key);

  @override
  State<TeamAQuestions> createState() => _TeamAQuestionsState();
}

class _TeamAQuestionsState extends State<TeamAQuestions> {
  bool isTapped = false;

  String ans = "";

  late String totalTime;
  List<QuestionStruct> questionbank = [
    QuestionStruct(
        R1: 'Duniya ke aage sabse upar me rehata hu ! Sabse imtehan ke vakt milta hu aur kitabe deta hu Khamoshi hai mera ehsaas Mujhe dundo me kahi hunga tumhare pass ',
        R2: 'I have been around for millennia but am only a month old. What am I? ',
        R3: 'Parth is a football player and he kicked a ball at an angle of 35° with the ground. It hits a target that is 30 meters away at a height of 1.8 meters. Now parth wants to know the time for the ball to reach the target.',
        A: 'MOON2',
        l: 'LEVEL 1'),
    QuestionStruct(
        l: 'LEVEL 2',
        R1: 'Find the doors of the lab where you brew the potions',
        R2: 'Hermione was bored in the train, and randomly got curious about the length of the train. She knew that the train was running at 200 km/hr and She asked Ron to find out how long does it take to cross a certain pole that is in the way, and it came out to be 36 seconds.',
        R3: 'Inside an egg, my song sits waiting for you to hear it while you are bathing. Who am I?',
        A: '1091011141090971051000130102000'),
    QuestionStruct(
        l: 'LEVEL 3',
        R1: 'Eito(bricks) ka sharir aur do lakdi ke hath Har waqt sabko upar se dekhu aur hardam Rahu tumhare sath Awaj meri hai itni buland ki usse pura walchand chale Meri awaj me hai kuch aisa sukun ki lecture me baccho ko rahat mile Dundo muze hunga tumhare najdik hi',
        R2: 'If eleven plus two equals one,What does nine plus five equals',
        R3: '{.----  —-.  ….-  –...}',
        A: '19472'),
    QuestionStruct(
        l: 'LEVEL 4',
        R1: 'Sab kuch Banta he mitti se aur aakhir me mitti me mil jata he, Uss mitti koo dundo Jaha se chalu huaa khel Ek circle ke niche Sare milke pohocho uss jagah agar chahat he jit ki',
        R2: '',
        R3: '',
        A: 'Alohomora')
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
      hintText: "Find me",
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
              width: MediaQuery.of(context).size.width *.30,
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
                              padding:kPadding,
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
                              Navigator.of(context).pushReplacement(
                                  CupertinoPageRoute(
                                      builder: (context) => LastPage(totalTime: totalTime, lap: laps,)));
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
