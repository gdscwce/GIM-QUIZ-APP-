import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}
class _TimerPageState extends State<TimerPage> {
  String  Sminute ="00", Ssecond="00";
  int  minutes =0, second =0;
  late Timer timer;

  List laps =[];
  void pauseTime(){
    timer.cancel();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  void startTimer(){
    timer= Timer.periodic(Duration(seconds: 1), (timer) {
      secondIncrement();
    });
  }
  void  lapAdd(){
    String lap = "$Sminute : $Ssecond";
    setState(() {
      laps.add(lap);
    });
  }

  void secondIncrement(){
    setState(() {
      if (second < 59){
        second++;
        Ssecond =second.toString();
        if(Ssecond.length==1){
          Ssecond = "0"+ Ssecond;
        }
      }else{
        minIncrement();
      }
    });
  }
  void minIncrement(){
    setState(() {
      second =0;
      Ssecond= "00";
      minutes++;
      Sminute= minutes.toString();
      if(Sminute.length==1){
        Sminute= "0"+Sminute;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          " $Sminute : $Ssecond",
          style: TextStyle(fontSize:  22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}
