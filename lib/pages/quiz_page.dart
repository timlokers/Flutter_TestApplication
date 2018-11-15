import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import '../pages/score.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Tim is human", true),
    new Question("Pizza is healthy", false),
    new Question("Tim is awesome", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool isOverlayVisible = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      isOverlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( //main container
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText,questionNumber),
            new AnswerButton(false,() => handleAnswer(false)),
          ],
        ),
        isOverlayVisible == true ? new CorrectWrongOverlay(
            isCorrect,
            (){
              if(quiz.length == questionNumber) {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)));
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState((){
                isOverlayVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;
              });
            }
        ) : new Container()
      ],
    );
  }

}
