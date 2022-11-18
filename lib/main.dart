import 'package:flutter/material.dart';
import 'package:gdscquiz/constants.dart';
import 'package:gdscquiz/screens/firstScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(
          Theme.of(context).textTheme,

        ),

        scaffoldBackgroundColor: kColour
      ),
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
      );
  }
}


