class QuestionStruct {
  late String riddle1;
  late String riddle2;
  late String riddle3;
  late String answer;
  late String level;

  QuestionStruct({required String l ,required String R1, required String R2,  required String R3, required String A}) {
    level =l;
    riddle1= R1;
    riddle2= R2;
    riddle3= R3;
    answer =A;
  }
}
