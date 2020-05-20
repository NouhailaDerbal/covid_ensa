import 'package:covidensa/pages/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

  int currentQuestion = 0; // had variable howa ch7al man question jawbna 3lih l7ad ssa3a  li kibda bi 0 o kiybda ytzad
  int score = 0; // had variable howa resultat h7ta hiya kitabda bi 0 o kitbada tzad
  int correctCounter = 0; // hnya compteur li kiy7ssab ch7a man Question ss7i7a
  int wrongCounter = 0; // hanaya compteur li kiy7ssab ch7al mman question khata2e
  bool quizCompleted = false;  // had variable dyal kintisstiw bih wach quiz sala ola nn bach manb9awch kindoro fi boucle infini
  void nextQuestion(bool answer, BuildContext context) {
    setState(() {
      if (!quizCompleted) {
        if (questions[currentQuestion].answer == answer) {
          correctCounter++;
          score += 1;
        } else {
          wrongCounter++;
        }
      }

      if (questions.length - 1 > currentQuestion) {
        currentQuestion++;
      } else {
        quizCompleted = true;
        showResults(context);
      }
    });
  }

  void showResults(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Fin du Quiz',
              style: TextStyle(fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.tag_faces,
                    size: 52.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Merci pour votre participation'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(' Votre résultat est : ($score) ')
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Réinitialiser'),
                onPressed: () {
                  setState(() {
                    quizCompleted = false;
                    score = 0;
                    currentQuestion = 0;
                    wrongCounter = 0;
                    correctCounter = 0;
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Text(
            questions[currentQuestion].text,
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Expanded(
          flex: 1,
          child: ButtonTheme(
            minWidth: 200,
            buttonColor: Colors.white,
            splashColor: Colors.deepPurple,
            child: RaisedButton(
              onPressed: () {
                nextQuestion(true, context);
              },
              child: Text('Oui', style: TextStyle(fontSize: 32.0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          flex: 1,
          child: ButtonTheme(
            minWidth: 200,
            buttonColor: Colors.white,
            splashColor: Colors.deepPurple,
            child: RaisedButton(
              onPressed: () {
                nextQuestion(false, context);
              },
              child: Text('Non', style: TextStyle(fontSize: 32.0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Correcte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    correctCounter.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Faute',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    wrongCounter.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}