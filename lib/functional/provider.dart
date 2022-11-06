import 'dart:async';

import 'package:flutter/cupertino.dart';

class AppTimer with  ChangeNotifier{
   late Timer _timer;

  int min = 0;
  int sec = 0;
  bool _startEnable = true;
  bool _stopEnable = false;
  bool _continueEnable = false;
  String  Sminute ="00", Ssecond="00";

  int get minute => min;
  int get seconds => sec;
  String get sminute => Sminute;
  String get ssecond => Ssecond;
  bool get startEnable => _startEnable;
  bool get stopEnable => _stopEnable;
  bool get continueEnable => _continueEnable;

  void startTimer() {

    min = 0;
    sec = 0;
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (sec < 59) {
        sec++;
        Ssecond = sec.toString();
        if (Ssecond.length == 1) {
          Ssecond = "0" + Ssecond;
        }
      } else {
        sec = 0;
        Ssecond = "00";
        min++;
        Sminute = min.toString();
        if (Sminute.length == 1) {
          Sminute = "0" + Sminute;
        }
      }
      notifyListeners();
    }
    );
  }

   void stopTimer() {
     if (_startEnable == false) {
       _startEnable = true;
       _continueEnable = true;
       _stopEnable = false;
       _timer.cancel();
     }
     notifyListeners();
   }



   void continueTimer() {
     _startEnable = false;
     _stopEnable = true;
     _continueEnable = false;

     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
       if (sec < 59) {
         sec++;
         Ssecond = sec.toString();
         if (Ssecond.length == 1) {
           Ssecond = "0" + Ssecond;
         }
       } else {
         sec = 0;
         Ssecond = "00";
         min++;
         Sminute = min.toString();
         if (Sminute.length == 1) {
           Sminute = "0" + Sminute;
         }
       }
       notifyListeners();
     }

     );
   }
}