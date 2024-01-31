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
        backgroundColor: Colors.blueAccent,
        elevation: 8,
        title: const Center(
          child: Text(
            'Quiz App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() => Column(
    children: [
      Image.asset(
        'images/background.png',
      ),
      OutlinedButton(
        child: const Text('Start Quiz !'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizPage()),
          );
        },
      )
    ],
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
  var _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    final snackBar = SnackBar(
      content: Row(
        children: [
          Text(
            score == 1 ? 'Bonne réponse !' : 'Mauvaise réponse !',
          ),
          Image.asset(
            score == 1 ? 'images/result-sup-5.gif' : 'images/result-und-5.gif',
            height: 100,
            width: 100,
          ),
          Expanded(
            child: Text(
              questionData.getExplanation(questionNumber),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              child: const Text('Prochaine question'),
              onPressed: () {
                var correctAnswer = questionData.getResponse(questionNumber);
                if (correctAnswer == true) {
                  setState(() {
                    questionNumber++;
                    _questionIndex = _questionIndex + 1;
                  });
                } else {
                  setState(() {
                    questionNumber++;
                    _questionIndex = _questionIndex + 1;
                  });
                }
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 8,
            title: const Center(
              child: Text(
                'Score :',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: _questionIndex < questionData.questionList.length
              ? Column(
            children: <Widget>[
              Text('Question n°${questionData.questionList[_questionIndex].id} sur 10'),
              Text(questionData.questionList[_questionIndex].question),
              Image.asset(
                questionData.questionList[_questionIndex].getImage(),
                height: 300,
                width: 300,
              ),
              ElevatedButton(
                child: const Text('Vrai'),
                onPressed: () => _answerQuestion(1),
              ),
              ElevatedButton(
                child: const Text('Faux'),
                onPressed: () => _answerQuestion(0),

              ),
            ],
          )
              : const Center(
            child: Text('Le quiz est terminé !'),
          )
      );
    }
  }

