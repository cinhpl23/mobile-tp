import 'package:flutter/material.dart';
import 'package:mobile_tp/questionData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      home: MyHomePage(title: 'QuizApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent.shade700,
        elevation: 8,
        title: const Center(
          child: Text(
            'Quiz App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() => Center(
      child: Column(
        children: [
          Image.asset(
            'images/background.png',
            height: 500,
            width: 500,
          ),
          OutlinedButton(
            child: const Text('Start Quiz !', style:
            TextStyle(fontSize: 56)
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizPage()),
              );
            },

          )
        ],
      )
  );
}


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final questionData = QuestionData();
  int questionNumber = 0;
  int _totalScore = 0;

  // Widget to get quiz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent.shade700,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Question ${questionNumber +1} / 10',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Text('Score : $_totalScore',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ]

          ),
        ),
        body: questionNumber < questionData.questionList.length
            ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(questionData.questionList[questionNumber].question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(180),
                  child:  Image.asset(
                      questionData.questionList[questionNumber].getImage(),
                      fit: BoxFit.cover

                  ),
                )

            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  ElevatedButton(
                    onPressed: () => _answerQuestion(1),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan.shade400,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                    child: const Text('Vrai',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 48
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _answerQuestion(0),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade400,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                    child: const Text('Faux',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 48
                      ),
                    ),

                  ),
                ]
            )

          ],
        )
            : Center(
            child: AlertDialog(
              title: const Text('Fin du quiz !'),
              content: Column(
                children: [
                  Text(_totalScore > 5
                      ? 'Votre score est de $_totalScore points !'
                      : 'Votre score est de $_totalScore points !'),
                  Image.asset(
                    _totalScore > 5
                        ? 'images/result-sup-5.gif'
                        : 'images/result-und-5.gif',
                    height: 500,
                    width: 500,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:const Text('Recommencer le quiz'),
                ),
              ],
            )
        )
    );
  }

  // SnackBar display answer correct or not
  void _answerQuestion(int score) {
    _totalScore += score;

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 300.0),
      padding: const EdgeInsets.all(50.0),
      duration: const Duration(days: 1),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(score == 1 ? 'Bonne réponse !' : 'Mauvaise réponse !',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              )
          ),
          Text('Score : $_totalScore / 10',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              )
          ),
          Image.asset(
            score == 1 ? 'images/oui.gif' : 'images/non.gif',
            height: 200,
            width: 200,
          ),
          Text(questionData.getExplanation(questionNumber)),
          ElevatedButton(
            child: const Text('Prochaine question'),
            onPressed: () {
              var correctAnswer = questionData.getResponse(questionNumber);
              if (correctAnswer == true) {
                setState(() {
                  questionNumber++;
                });
              } else {
                setState(() {
                  questionNumber++;
                });
              }
              ScaffoldMessenger.of(context).hideCurrentSnackBar();},
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

