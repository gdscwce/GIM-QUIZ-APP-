import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdscquiz/functional/timer.dart';
import 'package:gdscquiz/screens/Map.dart';

class CoustomAppBar extends AppBar{
  CoustomAppBar({
    Key? key, Widget ?title})
      :super(key: key, title: title, actions: [
        TimerPage()
         ],leading: CollegeMap());



}
