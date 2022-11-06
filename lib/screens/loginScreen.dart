import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/constants.dart';
import 'package:gdscquiz/screens/team1Screens/team1Question.dart';
import 'package:gdscquiz/screens/team2Screens/team2Question.dart';
import 'package:gdscquiz/screens/team3Screens/team3Question.dart';
import 'package:gdscquiz/screens/team4Screens/team4Question.dart';
import 'package:gdscquiz/screens/team5Screens/team5Question.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {


    final firstNameField = TextFormField(
        autofocus: false,
        controller: kFirstName,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          kFirstName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: kFillColour,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final teamNameField = TextFormField(
        autofocus: false,
        controller: kTeam,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("last  Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          kTeam.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: kFillColour,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Team Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: kPassword,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          kPassword.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: kFillColour,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    return Scaffold(
      backgroundColor: kColour,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            firstNameField,
            SizedBox(
              height: 10,
            ),
            teamNameField,
            SizedBox(
              height: 10,
            ),
            passwordField,
            SizedBox(
              height: 10,
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
                         if (kFirstName.text == "" ||
                             kTeam.text == "" ||
                             kPassword.text == "") {
                           showDialog(
                               context: context,
                               builder: (context) {
                                 return Container(
                                   child: AlertDialog(
                                     title: Text(
                                       "Fill your details properly",
                                       style: TextStyle(color: Colors.red),
                                     ),
                                   ),
                                 );
                               });
                         } else if (
                         kFirstName!=""
                         ){
                           if (kTeam.text == "TEAM-A" &&
                               kPassword == "GDSCTHTEAM-A" &&
                               kFirstName != "") {
                             Navigator.push(
                                 context,
                                 CupertinoPageRoute(
                                     builder: (context) => TeamAQuestions()));
                           } else if (kTeam.text == "TEAM-B" &&
                               kPassword == "GDSCTHTEAM-B" &&
                               kFirstName != "") {
                             Navigator.push(
                                 context,
                                 CupertinoPageRoute(
                                     builder: (context) => TeamBQuestions()));
                           } else if (kTeam.text == "TEAM-C" &&
                               kPassword == "GDSCTHTEAM-C" &&
                               kFirstName != "") {
                             Navigator.push(
                                 context,
                                 CupertinoPageRoute(
                                     builder: (context) => TeamCQuestions()));
                           } else if (kTeam.text == "TEAM-D" &&
                               kPassword == "GDSCTHTEAM-D" &&
                               kFirstName != "") {
                             Navigator.push(
                                 context,
                                 CupertinoPageRoute(
                                     builder: (context) => TeamDQuestions()));
                           } else if (kTeam.text == "TEAM-E" &&
                               kPassword == "GDSCTHTEAM-E" &&
                               kFirstName != "") {
                             Navigator.push(
                                 context,
                                 CupertinoPageRoute(
                                     builder: (context) => TeamEQuestions()));
                           }
                         }


                       });

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
    );
  }
}
