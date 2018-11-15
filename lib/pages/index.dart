import 'package:flutter/material.dart';
import './quiz_page.dart';

class index extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return new Material(
      color: Colors.lightBlue,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Quizzz", style: new TextStyle(color: Colors.white, fontSize: 50.0)),
            new Text("Tap here man!", style: new TextStyle(color: Colors.white, fontSize: 30.0))
          ],
        ),
      ),
    );
  }
}