import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/screens/team2Screens/team2Question.dart';

import 'package:gdscquiz/screens/team3Screens/team3Question.dart';

import '../../constants.dart';
import 'WelcomeB.dart';

class Team2Login extends StatefulWidget {
  const Team2Login({Key? key}) : super(key: key);

  @override
  State<Team2Login> createState() => _Team2LoginState();
}

String pass = "";
TextEditingController KthisName = TextEditingController();
TextEditingController KthisPassword = TextEditingController();
late String Kname;

class _Team2LoginState extends State<Team2Login> {
  final firstNameField = TextFormField(
      autofocus: false,
      controller: KthisName,
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
        KthisName.text = value!;
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

  //password field
  final passwordField = TextFormField(
      autofocus: false,
      controller: KthisPassword,
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
        KthisPassword.text = value!;
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            title: FittedBox(
              child: Text('TEAM-B'),
            ),
          ),
          backgroundColor: kColour,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0,left: 15.0),
              child: Column(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('assets/teamLoginBack.jpg'),
                    ),
                  ),
                  Card(

                    elevation: 0,

                    color: Color(0xffD39351),
                    child: Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 15.0,left: 15.0),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),

                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            firstNameField,
                            SizedBox(
                              height: 30,
                            ),
                            passwordField,
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Card(

                                color: kColour,
                                child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blue,
                                    child: MaterialButton(
                                      minWidth: MediaQuery.of(context).size.width / 4,
                                      onPressed: () {
                                        setState(() {
                                          pass = KthisPassword.text;
                                          if (KthisName != "") {
                                            if (KthisPassword.text ==
                                                "GDSCTHTEAM-B") {
                                              Kname=KthisName.text.trim();

                                              Navigator.pushReplacement(
                                                  (context),
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          WelcomeB(name: Kname)));
                                            }else if(KthisPassword.text !=
                                                "GDSCTHTEAM-B") {
                                              showDialog(
                                                  context: (context),
                                                  builder: (context) {
                                                    return Container(
                                                      child: AlertDialog(
                                                        title: Text("Wrong Password"),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text("Ok"))
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            }else{
                                              showDialog(
                                                  context: (context),
                                                  builder: (context) {
                                                    return Container(
                                                      child: AlertDialog(
                                                        title: Text("Enter Password"),
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
                                          } else {
                                            showDialog(
                                                context: (context),
                                                builder: (context) {
                                                  return Container(
                                                    child: AlertDialog(
                                                      title: Text("Enter Your Name"),
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
                                      },
                                      child: const Text(
                                        "Next",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: kTextColour,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
