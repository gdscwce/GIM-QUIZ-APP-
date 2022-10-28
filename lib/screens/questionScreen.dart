import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/constants.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

 const answer = "";
class _QuestionScreenState extends State<QuestionScreen> {
  @override
  final AnswerField = TextFormField(
      autofocus: false,
      controller: kAnswerText,
      keyboardType: TextInputType.name,
      validator: (value) {

        if (value!.isEmpty) {
          return null;
        }
        if(value!= answer){
          return("Sorry !!, but I am not the one you locking for");
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


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solve Me'),
        centerTitle: true,
        backgroundColor: kColour,
      ),
      backgroundColor: kColour,
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

               height: 300,
              width:  MediaQuery. of(context). size. width ,
              decoration: const BoxDecoration(
                color: Colors.white,

                borderRadius:  BorderRadius.all(Radius.circular(8.0)) ,
              ),
            ),
          SizedBox(height: 40,),
          AnswerField
          ],
        ),
      )
    );
  }
}
