import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{
  @override
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new Column( //main container
          children: <Widget>[
            new AnswerButton(true, () => print("True is pressed")),
            new AnswerButton(false,() => print("False is pressed"))
          ],
        ),
      ],
    );
  }

}
