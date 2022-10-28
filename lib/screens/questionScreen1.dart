import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/constants.dart';
import 'package:gdscquiz/screens/lastPage.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

//TODO::ADD Question and its answer
const Question = "What is my name";
const answer = "name";
var Hint = "Hint";
bool isTapped=false;
class _QuestionScreenState extends State<QuestionScreen> {
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
        appBar: AppBar(
          title: const Text('Solve Me'),
          centerTitle: true,
          backgroundColor: kColour,
        ),
        backgroundColor: kColour,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
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
                      children:  [
                        const Text(
                          Question,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Hint: 4 letter word", style: TextStyle(color: Colors.blueGrey), )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
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
                            (kAnswerText.text == answer)
                                ? Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LastPage()))
                                : Error();
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
}
