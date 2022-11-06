import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../QuestionStructure.dart';
import '../../constants.dart';
import '../../functional/provider.dart';
import '../appbar.dart';
import '../lastPage.dart';

class TeamAQuestions extends StatefulWidget {
  const TeamAQuestions({Key? key}) : super(key: key);

  @override
  State<TeamAQuestions> createState() => _TeamAQuestionsState();
}

class _TeamAQuestionsState extends State<TeamAQuestions> {



  bool isTapped = false;
  var timer;
  String ans = "";

  List<QuestionStruct> questionbank = [
  QuestionStruct(R1: 'most visited place in walchand', R2: 'enter the no on cheat', R3: '1*33', A: 'LI3033'),

  ];

  int questionNo = 0;

  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CoustomAppBar(),
        backgroundColor: kColour,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          questionbank[questionNo].riddle1,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 7,
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(

                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          questionbank[questionNo].riddle2,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 7,
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),  Container(

                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          questionbank[questionNo].riddle3,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 7,
                        ),

                      ],
                    ),
                  ),
                ),
                AnswerField,
                const SizedBox(
                  height: 40,
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
                          onPressed: () {
                            setState(() {
                              ans = kAnswerText.text;
                              if (ans == questionbank[questionNo].answer){
                                if (questionNo < questionbank.length -1) {
                                  questionNo++;
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      CupertinoPageRoute(builder: (context) => LastPage()));
                                }
                              }else if( ans == '') {
                                showDialog(context: (context), builder: (context){
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
                                    ) ,
                                  );
                                });
                              } else{
                                showDialog(context: (context), builder: (context){
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
                                    ) ,
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
              ],
            ),
          ),
        ));
  }

  Widget AppTime() {
    return Container(
      child: Consumer<AppTimer>(builder: (context, AppTimer, widget) {
        return Container(
          child: Center(
            child: Text(
              '${timer.sminute} : ' + '${timer.ssecond} ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        );
      }),
    );
  }
}

