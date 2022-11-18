import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../QuestionStructure.dart';
import '../../constants.dart';
import '../lastPage.dart';

class TeamCQuestions extends StatefulWidget {
  const TeamCQuestions({Key? key}) : super(key: key);

  @override
  State<TeamCQuestions> createState() => _TeamCQuestionsState();
}

class _TeamCQuestionsState extends State<TeamCQuestions> {
  @override
  bool isTapped = false;

  String ans = "";

  late String totalTime;
  List<QuestionStruct> questionbank = [
    QuestionStruct(
        R1: 'Bar bar din ye aaye ki Mere aas pass \n humesha mohol khushnuma ban jaye!\nMe dekhu har roj dosto ka pyar aur unka yarana \nMere pass Ane ke liye zaruri hai acche dost banana',
        R2: 'Pani se nikla darakht ek,\nPaat nahi par daal anek,\nEk darakht ki thandi chaya, \nNiche ek baith n paya',
        R3: 'A piece of ice is dropped in a vesel containing kerosene. When ice melts, the level of kerosene will\nA.Rise\nB.Fall\nC.Remain Same\nD.None of these',
        A: 'DSSHOWERB',
        l: 'LEVEL 1'),
    QuestionStruct(
        l: 'LEVEL 2',
        R1: 'Upar Neeche Chalke me aage bhadu gadiyo ka hu vibhina angh\nSara jeevan mera chale yantrik abhiyantrik ke sangh\nYantrik abhiyantrik ka swagat karu har roj\nDondo mujhe kyuki asan nahi hai meri khoj',
        R2: 'ऐसी कौन सी चीज है जो बारिश में चाहें जजतनी भीगे, वह कभी गीली नहीीं हो सकती है?',
        R3: 'The purpose of choke in tube light is \nA) Induce high voltage\nB) Induce low resistance\nC) Induce high resistance\nD) Induce low voltage',
        A: 'ENWATERA'),
    QuestionStruct(
        l: 'LEVEL 3',
        R1: 'Lohe ke do rasto par\nChalta hu!\nAb 75 saal se kisi dwar par tehar gaya hu !\nSabka swagat me karu har roj\nJari rakho apni mujhe dodhne ki khoj!',
        R2: 'Khushbu hai gulab nahi,\nRangeen hai lekin sharab nahi, \nSugand hai koi prem part nahi,\nYe jehar hai lekin gulab nahi.',
        R3: 'Find the missing number in the series?\n 4, 18, ?, 100, 180, 294, 448\nA) 48\nB) 50\nC) 58\nD) 60',
        A: 'MEPERFUMEA'),
    QuestionStruct(
        l: "LEVEL4",
        R1: '',
        R2: '',
        R3: 'Mubarako ab yeh hai akhari padhav\nCampus ke me beecho becch mere har taraf hai pathar ka chadav\n75 saalo se me dekhu sabko sabpe rehati hardam meri nazar\nMere se hai walchand Roshan mere bina sunna banjar\nVeena dhare hath mei swetha hai vastra mere aur khete hai mujhe bharati\nRoop mera hai itna tejasvi bilkul gagan me chadrama ke bhati\nKhajana ki koj hai badi mushkil mujhe jaldi doondo taki jeet kar ho jao tum safal\nAgar har gaya tum tho naraz na kyuki koshish karne vale kabhi nahi hote vifaal.',
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
                              child: Center(
                                child: Text(questionbank[questionNo].riddle1,
                                    style: kRiddleText),
                              ),
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
                              child: Center(
                                child: Text(questionbank[questionNo].riddle2,
                                    style: kRiddleText),
                              ),
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
                              child: Center(
                                child: Text(questionbank[questionNo].riddle3,
                                    style: kRiddleText),
                              ),
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
                          if (ans == questionbank[questionNo].answer) {
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
