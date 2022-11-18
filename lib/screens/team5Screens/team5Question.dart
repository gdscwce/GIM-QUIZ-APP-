import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../QuestionStructure.dart';
import '../../constants.dart';
import '../lastPage.dart';

class TeamEQuestions extends StatefulWidget {
  const TeamEQuestions({Key? key}) : super(key: key);

  @override
  State<TeamEQuestions> createState() => _TeamEQuestionsState();
}

class _TeamEQuestionsState extends State<TeamEQuestions> {
  @override
  bool isTapped = false;

  String ans = "";

  late String totalTime;
  List<QuestionStruct> questionbank = [
    QuestionStruct(
        R1: 'Me Khel Desi nahi lekin videsi hu!\nFilmo me pyar badhane ke kaam ata hu\nFata hue jhale jaise shakal hai meri\nSocho kaha Rahul Anjali ki shuru hui thi kahani',
        R2: 'What has many keys but can’t open a single lock?',
        R3: 'A is B’s sister. C is B’s mother.D is C’s father. E is D’s mother. Then , how is A related to D?\n A) Grandfather\nB) Grandmother\nC) Daughter\nD) Granddaughter',
        A: 'GEPIANOD',
        l: 'LEVEL 1'),
    QuestionStruct(
        l: 'LEVEL 2',
        R1: 'Mubarako ab ata hai agla padav\nMujhe doodhna hai mushkil tho savdhani se kare chunav!\nMai saalo se hu ek kamare me bandh\nTel ya petrol pe jeta hu lekin mujhe Milne pe hai pratibandh\nVipati ke samay hu mai urja srot aur hu kisi branch me jise khehate hai (core)\nDundho me hu kahi aas pass jaise Bramhastra me Shiva chale humesha roshani ki aor',
        R2: 'मध्य हटाकर कल जाऊ , प्रथम हटाकर दो मल\nअन्त हटाकर कम होऊ , घर है मेरा जलथल',
        R3: 'If\n 8801=5\n5261=1\n9632=2\n6381=3\n6321=?\nA. 4\nB. 2\nC. 1\nD. 3',
        A: 'EXLOTUSC'),
    QuestionStruct(
        l: 'LEVEL 3',
        R1: 'Imtihaan ki gadi ab an padi\nJaha se nikalte hai imtihaan ka anjam har ghadi\nUske peeche jati hai ek sunsan raha!\nDoodhna mushkil nahi hai mujhe agar tumhare man me ho mujhe doodhne ki chaha!',
        R2: 'Mirage is an example of\nA) Reflection of light & Refraction of light\nB) Total Internal Reflection\nC) Dispersion of light\nD) Refraction of light & Total Internal Reflection of light',
        R3: 'Nahi chaiye engine mujko,\nNahi chaiye khana, \nMujh par chadkar aaspas kar,\nKar lo safar suhana.',
        A: 'SIBBICYCLE'),
    QuestionStruct(
        l: 'LEVEL 4',
        R1: 'Mubarako ab yeh hai akhari padhav\nCampus ke me beecho becch mere har taraf hai pathar ka chadav\n75 saalo se me dekhu sabko sabpe rehati hardam meri nazar\nMere se hai walchand Roshan mere bina sunna banjar\nVeena dhare hath mei swetha hai vastra mere aur khete hai mujhe bharati\nRoop mera hai itna tejasvi bilkul gagan me chadrama ke bhati\nKhajana ki koj hai badi mushkil mujhe jaldi doondo taki jeet kar ho jao tum safal\nAgar har gaya tum tho naraz na kyuki koshish karne vale kabhi nahi hote vifaal.',
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
