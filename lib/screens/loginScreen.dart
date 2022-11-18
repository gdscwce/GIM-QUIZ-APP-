import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/constants.dart';
import 'package:gdscquiz/screens/team1Screens/login1.dart';
import 'package:gdscquiz/screens/team2Screens/login2.dart';
import 'package:gdscquiz/screens/team3Screens/login3.dart';
import 'package:gdscquiz/screens/team4Screens/login4.dart';
import 'package:gdscquiz/screens/team5Screens/login5.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
const kButtonTextStyle= TextStyle(
  fontSize: 20,fontWeight: FontWeight.bold,
);


class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {






    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: FittedBox(child: Text('Teams')),
          centerTitle: true,
          backgroundColor:kAppBarColor ,
        ),

        backgroundColor: kColour,

        body:Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2


          ),
            children: [


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          (context),
                          CupertinoPageRoute(
                              builder: (context) => Team1Login()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: kContainerColour,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.red,
                                child: Image(
                                  image: AssetImage('assets/pikacuu.png'),
                                  fit:BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: FittedBox(child : Text('TEAM-A')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              Padding (
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          (context),
                          CupertinoPageRoute(
                              builder: (context) => Team2Login()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: kContainerColour,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.green,
                                child: Image(
                                  image: AssetImage('assets/sqidal.png'),
                                  fit:BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: FittedBox(child : Text('TEAM-B')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          (context),
                          CupertinoPageRoute(
                              builder: (context) => Team3Login()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: kContainerColour,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.yellow,
                                child: Image(
                                  image: AssetImage('assets/pokemon4.png'),
                                  fit:BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: FittedBox(child: Text('TEAM-C')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          (context),
                          CupertinoPageRoute(
                              builder: (context) => Team4Login()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: kContainerColour,
                      ),


                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.blue,
                                child: Image(
                                  image: AssetImage('assets/charmender.png'),
                                  fit:BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: FittedBox(child : Text('TEAM-D')),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Expanded(
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(
                         (context),
                         CupertinoPageRoute(
                             builder: (context) => Team5Login()));
                   },
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                       color: kContainerColour,
                     ),

                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(

                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Expanded(
                             child: Container(

                               child: Image(
                                 image:AssetImage('assets/balbasour.png'),
                                 fit:BoxFit.fill,
                               ),
                             ),
                           ),

                           Padding(
                             padding: const EdgeInsets.all(3.0),
                             child: FittedBox(child: Text('TEAM-E')),
                           )
                         ],
                       ),

                     ),
                   ),
                 ),
               ),
             )
            ],
      ),
        )
      ),
    );
  }
}
// Column(
// children: [
// SizedBox(
// height: 60,
// ),
// firstNameField,
// SizedBox(
// height: 10,
// ),
// teamNameField,
// SizedBox(
// height: 10,
// ),
// passwordField,
// SizedBox(
// height: 10,
// ),
// Align(
// alignment: Alignment.bottomRight,
// child: Card(
// color: kColour,
// child: Material(
// elevation: 5,
// borderRadius: BorderRadius.circular(30),
// color: Colors.white,
// child: MaterialButton(
// minWidth: MediaQuery.of(context).size.width,
// onPressed: () {
//
// setState(() {
// if (kFirstName.text == "" ||
// kTeam.text == "" ||
// kPassword.text == "") {
// showDialog(
// context: context,
// builder: (context) {
// return Container(
// child: AlertDialog(
// title: Text(
// "Fill your details properly",
// style: TextStyle(color: Colors.red),
// ),
// ),
// );
// });
// } else if (
// kFirstName!=""
// ){
// if (kTeam.text == "TEAM-A" &&
// kPassword == "GDSCTHTEAM-A" &&
// kFirstName != "") {
// Navigator.pushReplacement(
// context,
// CupertinoPageRoute(
// builder: (context) => TeamAQuestions()));
// } else if (kTeam.text == "TEAM-B" &&
// kPassword == "GDSCTHTEAM-B" &&
// kFirstName != "") {
// Navigator.pushReplacement(
// context,
// CupertinoPageRoute(
// builder: (context) => TeamBQuestions()));
// } else if (kTeam.text == "TEAM-C" &&
// kPassword == "GDSCTHTEAM-C" &&
// kFirstName != "") {
// Navigator.pushReplacement(
// context,
// CupertinoPageRoute(
// builder: (context) => TeamCQuestions()));
// } else if (kTeam.text == "TEAM-D" &&
// kPassword == "GDSCTHTEAM-D" &&
// kFirstName != "") {
// Navigator.pushReplacement(
// context,
// CupertinoPageRoute(
// builder: (context) => TeamDQuestions()));
// } else if (kTeam.text == "TEAM-E" &&
// kPassword == "GDSCTHTEAM-E" &&
// kFirstName != "") {
// Navigator.pushReplacement(
// context,
// CupertinoPageRoute(
// builder: (context) => TeamEQuestions()));
// }
// }
//
//
// });
//
// },
// child: const Text(
// "Next",
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20,
// color: kColour,
// fontWeight: FontWeight.bold),
// ),
// )),
// ),
// ),
// ],
// ),