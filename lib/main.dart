import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizebrain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int y = 0;
  int x = 0;
  Quizebrain quizeBrain = Quizebrain();

  void checkAnswer(bool userPick) {
    bool answer = quizeBrain.getAnswerType();

    setState(() {
      if (answer == userPick) {
        y++;
        studentSc.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        x++;
        studentSc.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      if (quizeBrain.tryAgain() == true) {
        quizeBrain.nextQuation();
      } else {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Finished",
          desc: "You got $y Right and $x Wrong",
          buttons: [
            DialogButton(
              child: Text(
                "Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        x = 0;
        y = 0;
        studentSc.clear();
      }
    });
  }

  // List<String> answerSh = ['False', 'True', 'True'];
  // List<String> quationList = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<Quations> quationBank = [
  //   Quations(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Quations(
  //       q: 'Approximately one quarter of human bones are in the feet.',
  //       a: true),
  //   Quations(q: 'A slug\'s blood is green.', a: true)
  // ];
  List<Icon> studentSc = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizeBrain.getAnswerText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: studentSc,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
